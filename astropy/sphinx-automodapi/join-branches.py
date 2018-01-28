#!/usr/bin/env python

import os
import sys

parents = sys.stdin.read()

commit = os.environ['GIT_COMMIT']

if commit.strip() == '16cded0809693d091e5996d253068afd577ac81f':
    print('-p 573b133f82002f37a16840dd76eafc5de4a46acd')
elif commit.strip() == '8aaa3b232887ecd74a92442420a0cd2f4c4c7957':
    print('-p 573b133f82002f37a16840dd76eafc5de4a46acd -p b53f89bb9b8cb437232bd2071ec221082f947a86')
elif commit.strip() == '0c1a706b4b3a911bc3ddf480ad20b4618bd0f81d':
    print('-p 64066420efdc5044b3c45b75ab0bed0da6d07fca')
else:
    print(parents)

#!/usr/bin/env python

import os
import sys

parents = sys.stdin.read()

commit = os.environ['GIT_COMMIT']

if commit.strip() == '16cded0809693d091e5996d253068afd577ac81f':
    print('-p 508375ea901f108efdde8c94fc875e08f419d94a')
else:
    print(parents)

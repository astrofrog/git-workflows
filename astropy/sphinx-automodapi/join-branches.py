#!/usr/bin/env python

import sys

parents = sys.stdin.read()

if parents.strip() == '':
    print('-p 0afd22dc535bbfb25cfc0ccd4185d597f1fc978d')
else:
    print(parents)

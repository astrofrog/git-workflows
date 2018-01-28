#!/usr/bin/env python

import os
import sys

parents = sys.stdin.read()

commit = os.environ['GIT_COMMIT']

# Make the following commit:
#
# Merge pull request astropy/astropy-helpers#1 from embray/master
#
# have the following parents:
#
# 508375ea Merge pull request astropy/astropy#2228 from hamogu/patch-1
# 89f66c00 Some tweaks to get the sphinx exts (nominally) working on Python 3--haven't tested building actual docs with them yet.
#
# This causes the first commit from astropy-helpers to be removed - this is
# needed otherwise it removes all the previous files then they are added back
# again afterwards.

if commit.strip() == '4a428bf464640a7ee8c9661a3285c7b5bf0086ef':
    print('-p 508375ea901f108efdde8c94fc875e08f419d94a -p 89f66c005bd3fe6efc77e118019293e1c63a3290')
else:
    print(parents)

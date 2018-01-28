#!/usr/bin/env python

import os
import sys

parents = sys.stdin.read()

commit = os.environ['GIT_COMMIT']

# The following commit:
#
# 86666906 Merge pull request astropy/astropy-helpers#89 from embray/issue-89
#
# has two parents, one from another branch, so just simplify this to have only:
#
# af0ef4684 Merge pull request astropy/astropy-helpers#88 from bsipocz/sphinx_smart_resolve_bases

if commit.strip() == '8666690607ac45958930d34f5fb2e593d47e54b6':
    print('-p af0ef4684683241908d59a380c916cda794e6b90')
else:
    print(parents)

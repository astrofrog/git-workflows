#!/usr/bin/env python

import os
import sys

parents = sys.stdin.read()

commit = os.environ['GIT_COMMIT']

# We set the last commit from sphinx-automodapi to have a parent which is the
# most recent commit in the merging branch:
#
# 5424416c Merge pull request astropy/astropy-helpers#226 from bsipocz/pep8_and_container_travis

if commit.strip() == '5424416c61cbecf4e114480e001e2e6c1de433ef':
    print('-p d67727f47caf3444d81c4e3898d5e2d90b19080a')
else:
    print(parents)

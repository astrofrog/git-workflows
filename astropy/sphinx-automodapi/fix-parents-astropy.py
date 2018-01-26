#!/usr/bin/env python

import os
import sys
import subprocess

commit = os.environ['GIT_COMMIT']
message = subprocess.check_output(f'git log -n 1 --pretty=format:%s {commit}', shell=True).decode('utf-8')

parents = sys.stdin.read()

if "Merge branch 'master' of github.com:astropy/astropy" in message:
    # Manual merges with this message have their parents flipped around
    # so we can swap them
    refs = parents.replace('-p', '').split()
    print(f'-p {refs[1]} -p {refs[0]}')
elif 'Update the changelog in master to reflect the release of 0.2' in message:
    # This commit causes v0.2.x  backported commits touching the theme to be
    # included, so we remove the reference to the v0.2.x branch (the second
    # parent)
    refs = parents.replace('-p', '').split()
    print(f'-p {refs[0]}')
else:
    print(parents)

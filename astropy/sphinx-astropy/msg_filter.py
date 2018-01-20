#!/usr/bin/env python

import sys

# Fetch commit message
message = sys.stdin.read()

# Check if it was a merge commit, and if so reword to include the original repo name
if message.startswith('Merge pull request #'):
    message = message.replace('pull request #', 'pull request astropy/astropy-helpers#')

print(message)

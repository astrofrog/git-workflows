#!/bin/bash -xe

# Make new repository to contain the theme
mkdir sphinx-astropy-theme
cd sphinx-astropy-theme
git init

# Add the astropy-helpers as a remote
git remote add astropy https://github.com/astropy/astropy
git fetch astropy
git checkout astropy/master
git checkout -b astropy-import

# Set master branch to match the helpers at the same point where we want to split
# off the theme.
git reset --hard 799d7a230cffc22667d75a1d7c6dbb956d34abae

# One of the commits has the parents in the wrong order so we fix this here
git filter-branch -f --parent-filter $PWD/../fix-parents-astropy.py astropy-import

# Move the theme directory in place and remove any other irrelevant files
git filter-branch -f --prune-empty --tree-filter $PWD/../tree_filter_astropy.sh astropy-import

# Go back to the master branch (for some reason we end up with a detached HEAD)
git checkout astropy-import

# Get rid of empty branches/merges
../../../common/filter_empty_merges.sh astropy-import

# Finally re-write commit messages to specify original repo in the merge commits
git filter-branch -f --msg-filter "sed 's/pull request #2 from eteq/pull request kbarbary\/astropy#2 from eteq/g'" astropy-import
git filter-branch -f --msg-filter "sed 's/pull request #/pull request astropy\/astropy#/g'" astropy-import

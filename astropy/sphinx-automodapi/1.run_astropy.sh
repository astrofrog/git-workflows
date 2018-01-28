#!/bin/bash -xe

# Make new repository to contain the theme
mkdir sphinx-automodapi
cd sphinx-automodapi
git init

# Add the astropy-helpers as a remote
git remote add astropy https://github.com/astropy/astropy
git fetch astropy
git checkout astropy/master
git checkout -b astropy-import

# Set master branch to match the helpers at the same point where we want to split
# off the theme. The theme was split off on March 26th
# git reset --hard 2bf73db71a8c37d6b9a9f070c53a11c92b678539
# UPDATE ME!

# One of the commits has the parents in the wrong order so we fix this here
git filter-branch -f --parent-filter $PWD/../fix-parents-astropy.py astropy-import

# Move the theme directory in place and remove any other irrelevant files
git filter-branch -f --prune-empty --tree-filter $PWD/../tree_filter_astropy.sh astropy-import

# Go back to the master branch (for some reason we end up with a detached HEAD)
git checkout astropy-import

# Get rid of empty branches/merges
../../../common/filter_empty_merges.sh astropy-import

# Finally re-write commit messages to specify original repo in the merge commits
git filter-branch -f --msg-filter "sed 's/pull request #/pull request astropy\/astropy#/g'" astropy-import

# Temporary fix for incorrect initial commit above
# Merge pull request astropy/astropy#2228 from hamogu/patch-1
git reset --hard 508375ea901f108efdde8c94fc875e08f419d94a

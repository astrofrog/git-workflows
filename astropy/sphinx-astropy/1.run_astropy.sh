#!/bin/bash -xe

# Make new repository to contain the theme
mkdir sphinx-astropy
cd sphinx-astropy
git init

# Add the astropy-helpers as a remote
git remote add astropy https://github.com/astropy/astropy
git fetch astropy
git checkout astropy/master
git checkout -b astropy-import

# Set master branch to match the helpers at the same point where we want to split
# off the theme. We want to split off at the last commit before March 26th 2018,
# which is the following:
#
# 1a154727 Manually merge pull request #1826 from kbarbary/automodsumm-paths
git reset --hard 1a154727

# One of the commits has the parents in the wrong order so we fix this here
git filter-branch -f --parent-filter $PWD/../fix-parents-astropy.py astropy-import

# Move the theme directory in place and remove any other irrelevant files
git filter-branch -f --prune-empty --tree-filter $PWD/../tree_filter_astropy.sh astropy-import

# Go back to the master branch (for some reason we end up with a detached HEAD)
git checkout astropy-import

# Get rid of empty branches/merges
../../../common/filter_empty_merges.sh astropy-import

# Finally re-write commit messages to specify original repo in the merge commits
git filter-branch -f --msg-filter "sed 's/pull request #6 from iguananaut/pull request mdboom\/astropy#6 from iguananaut/g'" astropy-import
git filter-branch -f --msg-filter "sed 's/pull request #/pull request astropy\/astropy#/g'" astropy-import

# Some remaining artisan changes to the tree to simplify effect of manual merges
git filter-branch -f --parent-filter "sed 's/-p b1b56c47f9f61b609f37ab0e390a27e5e3647026 -p c01867c9e343d4b2f820c43cbe7d391c9f21d709/-p c01867c9e343d4b2f820c43cbe7d391c9f21d709 -p b1b56c47f9f61b609f37ab0e390a27e5e3647026/g'" astropy-import
git filter-branch -f --parent-filter "sed 's/-p affe6464a7bb5dbe16bbf2b3340a772e8fa5c880/-p c01867c9e343d4b2f820c43cbe7d391c9f21d709/g'" astropy-import
git filter-branch -f --parent-filter "sed 's/-p b037e45ae3d3d4cf3dcae458b0ae947f1b29b69b/-p 1252781136f9eaaaffb99a460cda9c5ad89850ed/g'" astropy-import

# Cleanup
git filter-branch -f --prune-empty
git prune

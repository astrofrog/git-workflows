#!/bin/bash -xe

# Assume that 1.run_astropy.sh has already been run
cd sphinx-automodapi

# Add the astropy-helpers as a remote
git remote add helpers https://github.com/astropy/astropy-helpers
git fetch helpers
git checkout helpers/master
git checkout -b helpers-import

# Set master branch to match the helpers at the same point where we want to split
# off the theme.
git reset --hard 9f1eab94eb544488a854d454d3638e66fecbe9c7

# Move the theme directory in place and remove any other irrelevant files
git filter-branch -f --prune-empty --tree-filter $PWD/../tree_filter_helpers.sh helpers-import

# Go back to the master branch (for some reason we end up with a detached HEAD)
git checkout helpers-import

# Get rid of empty branches/merges
../../../common/filter_empty_merges.sh helpers-import

# Finally re-write commit messages to specify original repo in the merge commits
git filter-branch -f --msg-filter "sed 's/pull request #/pull request astropy\/astropy\-helpers#/g'" helpers-import

#!/bin/bash -x

# Assume that 1.run_astropy.sh has already been run
cd sphinx-astropy-theme

# Add the astropy-helpers as a remote
git remote add helpers git://github.com/astropy/astropy-helpers
git fetch helpers
git checkout helpers/master
git checkout -b helpers-import

# Set master branch to match the helpers at the same point where we want to split
# off the theme.
git reset --hard 17f64dcbe9286866905b9392cbb703abe193365e

# Move the theme directory in place and remove any other irrelevant files
git filter-branch -f --prune-empty --tree-filter $PWD/../tree_filter_helpers.sh helpers-import

# Go back to the master branch (for some reason we end up with a detached HEAD)
git checkout helpers-import

# Get rid of empty branches/merges
../../common/filter_empty_merges.sh helpers-import

# Finally re-write commit messages to specify original repo in the merge commits
git filter-branch -f --msg-filter $PWD/../msg_filter.py helpers-import

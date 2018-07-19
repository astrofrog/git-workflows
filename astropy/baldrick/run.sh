#!/bin/bash -xe

# Make new repository
mkdir baldrick
cd baldrick
git init

# Add the astropy-bot as a remote
git remote add upstream https://github.com/astropy/astropy-bot
git fetch upstream
git checkout upstream/master
git checkout -b upstream-import

# Move the theme directory in place and remove any other irrelevant files
git filter-branch -f --prune-empty --tree-filter $PWD/../tree_filter.sh upstream-import

# Go back to the import branch (for some reason we end up with a detached HEAD)
git checkout upstream-import

# Get rid of empty branches/merges
../../../common/filter_empty_merges.sh upstream-import

# Finally re-write commit messages to specify original repo in the merge commits
git filter-branch -f --msg-filter "sed 's/pull request #/pull request astropy\/astropy\-bot#/g'" upstream-import

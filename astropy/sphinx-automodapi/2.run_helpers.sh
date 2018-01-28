#!/bin/bash -xe

# Assume that 1.run_astropy.sh has already been run
cd sphinx-automodapi

# Add the astropy-helpers as a remote
git remote add helpers https://github.com/astropy/astropy-helpers
git fetch helpers
git checkout helpers/master
git checkout -b helpers-import

# Set master branch to match the helpers at the same point where we want to split
# off the theme. We don't include 5fdcd34137178a66825adad909f46a1af77c9beb because
# it was manually included with a separate PR into sphinx-automodapi
git reset --hard 5c3ec5401163888e1487bf64aebbfdd52affd964

# Move the theme directory in place and remove any other irrelevant files
git filter-branch -f --prune-empty --tree-filter $PWD/../tree_filter_helpers.sh helpers-import

# Go back to the master branch (for some reason we end up with a detached HEAD)
git checkout helpers-import

# Get rid of empty branches/merges
../../../common/filter_empty_merges.sh helpers-import

# Finally re-write commit messages to specify original repo in the merge commits
git filter-branch -f --msg-filter "sed 's/pull request #/pull request astropy\/astropy\-helpers#/g'" helpers-import

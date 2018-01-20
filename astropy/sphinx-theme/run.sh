#!/bin/bash -x

# Make new repository to contain the theme
mkdir sphinx-astropy-theme
cd sphinx-astropy-theme
git init

# Add the astropy-helpers as a remote
git remote add helpers git://github.com/astropy/astropy-helpers
git fetch helpers

# Set master branch to match the helpers at the same point where we want to split
# off the theme.
git reset --hard 17f64dcbe9286866905b9392cbb703abe193365e

# Move the theme directory in place and remove any other irrelevant files
git filter-branch -f --prune-empty --tree-filter $PWD/../tree_filter.sh master

# Go back to the master branch (for some reason we end up with a detached HEAD)
git checkout master

# Get rid of branches that no longer have any commits - this needs to be run
# multiple times before it converges - make sure the last line is
# WARNING: Ref 'refs/heads/master' is unchanged, if not you will need to
# run this command again
n_commits_prev="0"
while true; do
  n_commits=`git log --format=oneline | wc -l`
  echo "$n_commits commits remaining on branch"
  if [[ $n_commits == $n_commits_prev ]]; then
    echo "Number of commits has converged, stopping"
    break;
  fi
  git filter-branch -f --prune-empty --parent-filter $PWD/../parent_filter.py master;
  n_commits_prev=$n_commits;
done

# Finally re-write commit messages to specify original repo in the merge commits
git filter-branch -f --msg-filter $PWD/../msg_filter.py master

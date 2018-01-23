#!/bin/bash

# The purpose of this script is to get rid of branches that have no commits,
# for example the lower branch in:
#
# --o---o---o-->
#   \       /
#    -------
#
# This kind of situation might occur when running `git filter-branch` and then
# pruning empty commits.

# Find directory where this script is located
script_directory=$PWD"/"`dirname $0`

# Check which branch we should operate on
branch_name=$1

if [[ -z $branch_name ]]; then
  echo "Usage: ./filter_empty_merges.sh <branch_name>";
  exit 1;
fi

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
  git filter-branch -f --prune-empty --parent-filter $script_directory/parent_filter.py $branch_name;
  n_commits_prev=$n_commits;
done

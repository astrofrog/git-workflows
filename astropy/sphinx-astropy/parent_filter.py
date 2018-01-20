#!/usr/bin/env python

# This script is meant to be used in conjunction with git filter-branch --parent-filter
# and is used to get rid of branches that don't contain any commits. It looks
# for commits where all the parents are on the main branch, and re-writes
# the parents to be just the most recent of the original parents.
#
# To run:
#
#   git filter-branch -f --prune-empty --parent-filter <path_to>/parent_filter.py <branch-name>
#
# This may have to be run iteratively until the git history does not change.
#
# Documentation for --parent-filter:
#
# --parent-filter <command>
#   This is the filter for rewriting the commit’s parent list. It will receive
#   the # parent string on stdin and shall output the new parent string on
#   stdout. The # parent string is in the format described in
#   git-commit-tree[1]: empty for the # initial commit, "-p parent" for a normal
#   commit and "-p parent1 -p parent2 -p # parent3 …​" for a merge commit.

import sys
import subprocess

# Get the input parent string
parent_string = sys.stdin.read()

# Get rid of the -p and keep only the commits
parents = [x for x in parent_string.split() if x != '-p']

# Find the commits on the main branch, excluding commits in merged branches
git_cmd = 'git log --first-parent --format=oneline'
result = subprocess.check_output(git_cmd, shell=True).decode('utf-8')

# The output looks like:
#
# 6dec82f2c55d4f550e81c072e825c8563c5f0de7 Merge pull request #171 from embray/optimized-docstrings
# d4160c750299917e643cb4e277833097a50995bf Merge pull request #161 from eteq/add-docs-alias
# 7046302b00545cdf4151357b9032a4ecb8570c3b Merge pull request #164 from mdboom/fix-css
# afd597d7a2815b03ac330496678c899b5042cf3e Merge pull request #160 from mdboom/fix-invalid-html
# 4b5999e04d53fa211528281d4cda5ea305d7b0ad Merge pull request #147 from embray/issue-147
#
# Keep only the commits:

main_commits = [row.split()[0].strip() for row in result.splitlines()]

# If there is only one parent, we don't need to do anything. If there is more
# than one parent, then we check if all parents are in the main branch, and if
# so we modify the parent string to include just the most recent parent.
if len(parents) > 1:
    if all([p in main_commits for p in parents]):
        parent_string = '-p ' + next(c for c in main_commits if c in parents)

# We need to now print the parent string back to stdout
print(parent_string)

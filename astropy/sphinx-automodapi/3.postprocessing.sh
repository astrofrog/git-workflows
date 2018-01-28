#!/bin/bash -xe

cd sphinx-automodapi

git checkout helpers-import
git checkout -b merging

git filter-branch -f --parent-filter $PWD/../join-branches-1.py merging
git filter-branch -f --parent-filter $PWD/../join-branches-2.py merging
git filter-branch -f --parent-filter $PWD/../join-branches-3.py merging
git filter-branch -f --prune-empty merging

git prune

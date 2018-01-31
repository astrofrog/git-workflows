#!/bin/bash -xe

cd sphinx-astropy

git checkout helpers-import
git checkout -b merging

git filter-branch -f --parent-filter $PWD/../join-branches.py merging

git filter-branch --prune-empty
git prune

#!/bin/bash -xe

cd sphinx-automodapi

# git remote add automodapi https://github.com/astropy/sphinx-automodapi
# git fetch automodapi
# git checkout automodapi/master
# git checkout -b main
#
# git filter-branch -f --parent-filter $PWD/../join-branches-4.py main

# Now we need to make sure that files that were present before are not deleted
# and added back again. The d67727f4 commit is the last one from the
# astropy-helpers commits.
mkdir ../d67727f4
git checkout d67727f4
cp -RP sphinx_automodapi ../d67727f4/
git checkout main

git filter-branch -f --tree-filter "$PWD/../tree_filter_final_patch.sh $PWD/../d67727f4" main

git filter-branch -f --prune-empty

git prune

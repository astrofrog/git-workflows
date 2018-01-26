#!/bin/bash -xe

cd sphinx-astropy-theme

git filter-branch -f --parent-filter $PWD/../join-branches.py helpers-import

git filter-branch -f --commit-filter 'if [[ $GIT_COMMIT == 0e075563dba8d4f028bcb10cdd71e9b383ae9c63 ]]
                                      then
                                          skip_commit "$@";
                                      else
                                          git commit-tree "$@";
                                      fi'  HEAD

git prune

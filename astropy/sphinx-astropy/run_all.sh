#!/bin/bash -xe

./1.run_astropy.sh
cp -RP sphinx-astropy step1

./2.run_helpers.sh
cp -RP sphinx-astropy step2

./3.join_branches.sh
cp -RP sphinx-astropy step3

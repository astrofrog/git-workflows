#!/bin/bash -xe

./1.run_astropy.sh
cp -RP sphinx-astropy-theme step1

./2.run_helpers.sh
cp -RP sphinx-astropy-theme step2

./3.join_branches.sh
cp -RP sphinx-astropy-theme step3


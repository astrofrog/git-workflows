#!/bin/bash

mkdir -p sphinx_astropy_theme/bootstrap-astropy

if [ -d "astropy_helpers/sphinx/themes" ]; then
  mv astropy_helpers/sphinx/themes/bootstrap-astropy/* sphinx_astropy_theme/bootstrap-astropy/;
fi

rm -rf astropy_helpers/tests/package_template
git rm -rf --ignore-unmatch astropy_helpers/tests/package_template

rm -rf astropy_helpers/tests/testpackage
git rm -rf --ignore-unmatch astropy_helpers/tests/testpackage

find . -maxdepth 1 -not -name "." -not -name ".." -not -name ".git" -not -name "sphinx_astropy_theme" -exec rm -rf {} \;

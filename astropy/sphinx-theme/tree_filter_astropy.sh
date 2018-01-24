#!/bin/bash

mkdir -p sphinx_astropy_theme/bootstrap-astropy

if [ -d "astropy/sphinx/themes" ]; then
  mv astropy/sphinx/themes/bootstrap-astropy/* sphinx_astropy_theme/bootstrap-astropy/;
elif [ -d "docs/_themes" ]; then
  mv docs/_themes/bootstrap-astropy/* sphinx_astropy_theme/bootstrap-astropy/;
fi

rm -rf astropy_helpers
git rm -rf --ignore-unmatch astropy_helpers

find . -maxdepth 1 -not -name "." -not -name ".." -not -name ".git" -not -name "sphinx_astropy_theme" -exec rm -rf {} \;

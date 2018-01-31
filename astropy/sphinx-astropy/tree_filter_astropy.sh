#!/bin/bash

mkdir -p sphinx_astropy
mkdir -p sphinx_astropy/ext
mkdir -p sphinx_astropy/local

mv astropy/sphinx/__init__.py sphinx_astropy/ || true
mv astropy/sphinx/conf.py sphinx_astropy/ || true
mv astropy/sphinx/ext/__init__.py sphinx_astropy/ext/ || true
mv astropy/sphinx/ext/changelog_links.py sphinx_astropy/ext/ || true
mv astropy/sphinx/ext/doctest.py sphinx_astropy/ext/ || true
mv astropy/sphinx/ext/edit_on_github.py sphinx_astropy/ext/ || true
mv astropy/sphinx/ext/tocdepthfix.py sphinx_astropy/ext/ || true

rm -rf astropy_helpers
git rm -rf --ignore-unmatch astropy_helpers

find . -maxdepth 1 -not -name "." -not -name ".." -not -name ".git" -not -name "sphinx_astropy" -exec rm -rf {} \;

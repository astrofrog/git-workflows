#!/bin/bash

mkdir -p sphinx_astropy
mkdir -p sphinx_astropy/ext
mkdir -p sphinx_astropy/local

mv astropy_helpers/sphinx/__init__.py sphinx_astropy/ || true
mv astropy_helpers/sphinx/conf.py sphinx_astropy/ || true
mv astropy_helpers/sphinx/ext/__init__.py sphinx_astropy/ext/ || true
mv astropy_helpers/sphinx/ext/changelog_links.py sphinx_astropy/ext/ || true
mv astropy_helpers/sphinx/ext/doctest.py sphinx_astropy/ext/ || true
mv astropy_helpers/sphinx/ext/edit_on_github.py sphinx_astropy/ext/ || true
mv astropy_helpers/sphinx/ext/tocdepthfix.py sphinx_astropy/ext/ || true
mv astropy_helpers/sphinx/local/python3_local_links.inv sphinx_astropy/local/ || true
mv astropy_helpers/sphinx/local/python3_local_links.txt sphinx_astropy/local/ || true

rm -rf astropy_helpers/tests/package_template
git rm -rf --ignore-unmatch astropy_helpers/tests/package_template

rm -rf astropy_helpers/tests/testpackage
git rm -rf --ignore-unmatch astropy_helpers/tests/testpackage

find . -maxdepth 1 -not -name "." -not -name ".." -not -name ".git" -not -name "sphinx_astropy" -exec rm -rf {} \;

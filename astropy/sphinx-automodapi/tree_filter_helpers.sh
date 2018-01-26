#!/bin/bash

mkdir -p sphinx_automodapi

if [ -d "astropy_helpers/sphinx/ext" ]; then
  mv astropy_helpers/sphinx/ext/__init__.py sphinx_automodapi/ || true;
  mv astropy_helpers/sphinx/ext/astropyautosummary.py sphinx_automodapi/ || true;
  mv astropy_helpers/sphinx/ext/automodapi.py sphinx_automodapi/ || true;
  mv astropy_helpers/sphinx/ext/automodsumm.py sphinx_automodapi/ || true;
  mv astropy_helpers/sphinx/ext/smart_resolver.py sphinx_automodapi/ || true;
  mv astropy_helpers/sphinx/ext/utils.py sphinx_automodapi/ || true;
fi

mkdir -p sphinx_automodapi/templates/autosummary_core

if [ -d "astropy_helpers/sphinx/ext/templates/autosummary_core" ]; then
  mv astropy_helpers/sphinx/ext/templates/autosummary_core/* \
     sphinx_automodapi/templates/autosummary_core/ || true;
fi

mkdir -p sphinx_automodapi/tests

if [ -d "astropy_helpers/sphinx/ext/tests" ]; then
  mv astropy_helpers/sphinx/ext/tests/__init__.py sphinx_automodapi/tests/ || true
  mv astropy_helpers/sphinx/ext/tests/test_autodoc_enhancements.py sphinx_automodapi/tests/ || true
  mv astropy_helpers/sphinx/ext/tests/test_automodapi.py sphinx_automodapi/tests/ || true
  mv astropy_helpers/sphinx/ext/tests/test_automodsumm.py sphinx_automodapi/tests/ || true
  mv astropy_helpers/sphinx/ext/tests/test_utils.py sphinx_automodapi/tests/ || true
fi

rm -rf astropy_helpers/tests/package_template
git rm -rf --ignore-unmatch astropy_helpers/tests/package_template

rm -rf astropy_helpers/tests/testpackage
git rm -rf --ignore-unmatch astropy_helpers/tests/testpackage

find . -maxdepth 1 -not -name "." -not -name ".." -not -name ".git" -not -name "sphinx_automodapi" -exec rm -rf {} \;

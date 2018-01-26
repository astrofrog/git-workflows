#!/bin/bash

mkdir -p sphinx_automodapi

if [ -d "astropy/sphinx/ext" ]; then
  mv astropy/sphinx/ext/__init__.py sphinx_automodapi/ || true;
  mv astropy/sphinx/ext/astropyautosummary.py sphinx_automodapi/ || true;
  mv astropy/sphinx/ext/automodapi.py sphinx_automodapi/ || true;
  mv astropy/sphinx/ext/automodsumm.py sphinx_automodapi/ || true;
  mv astropy/sphinx/ext/smart_resolver.py sphinx_automodapi/ || true;
fi

mkdir -p sphinx_automodapi/templates/autosummary_core

if [ -d "astropy/sphinx/ext/templates/autosummary_core" ]; then
  mv astropy/sphinx/ext/templates/autosummary_core/* \
     sphinx_automodapi/templates/autosummary_core/ || true;
fi

mkdir -p sphinx_automodapi/tests

if [ -d "astropy/sphinx/ext/tests" ]; then
  mv astropy/sphinx/ext/tests/__init__.py sphinx_automodapi/tests/ || true
  mv astropy/sphinx/ext/tests/test_automodapi.py sphinx_automodapi/tests/ || true
  mv astropy/sphinx/ext/tests/test_automodsumm.py sphinx_automodapi/tests/ || true
fi

rm -rf astropy_helpers
git rm -rf --ignore-unmatch astropy_helpers

find . -maxdepth 1 -not -name "." -not -name ".." -not -name ".git" -not -name "sphinx_automodapi" -exec rm -rf {} \;

#!/bin/bash

mkdir -p sphinx_automodapi

# Move from original location
git mv astropy_helpers/sphinx/ext/astropyautosummary.py \
       astropy_helpers/sphinx/ext/autodoc_enhancements.py \
       astropy_helpers/sphinx/ext/automodapi.py \
       astropy_helpers/sphinx/ext/automodsumm.py \
       astropy_helpers/sphinx/ext/smart_resolver.py \
       astropy_helpers/sphinx/ext/traitsdoc.py \
       astropy_helpers/sphinx/ext/utils.py \
       sphinx_automodapi/ || true

mkdir -p sphinx_automodapi/templates/autosummary_core

git mv astropy_helpers/sphinx/ext/templates/autosummary_core/base.rst \
       astropy_helpers/sphinx/ext/templates/autosummary_core/class.rst \
       astropy_helpers/sphinx/ext/templates/autosummary_core/module.rst \
       sphinx_automodapi/templates/autosummary_core/ || true

mkdir -p sphinx_automodapi/tests

git mv astropy_helpers/sphinx/ext/tests/test_autodoc_enhancements.py \
       astropy_helpers/sphinx/ext/tests/test_automodapi.py \
       astropy_helpers/sphinx/ext/tests/test_automodsumm.py \
       astropy_helpers/sphinx/ext/tests/test_docscrape.py \
       astropy_helpers/sphinx/ext/tests/test_utils.py \
       sphinx_automodapi/tests/ || true

git rm -rf --ignore-unmatch astropy_helpers *.py CONTRIBUTING.md \
                            tox.ini setup.cfg appveyor.yml .travis.yml \
                            README.rst licenses CHANGES.rst MANIFEST.in \
                            .app* .install* continuous-integration \
                            .coveragerc .gitmodules .gitignore

git clean -fxd

#!/bin/bash

mkdir -p sphinx_astropy

# Remove theme if present since that is in a separate repository,
# and also remove sphinx extensions that have been split out that
# are at old locations.
git rm -rf --ignore-unmatch astropy_helpers/sphinx/themes \
                            astropy_helpers/sphinx/ext/astropyautosummary.py \
                            astropy_helpers/sphinx/ext/autodoc_enhancements.py \
                            astropy_helpers/sphinx/ext/automodapi.py \
                            astropy_helpers/sphinx/ext/automodsumm.py \
                            astropy_helpers/sphinx/ext/comment_eater.py \
                            astropy_helpers/sphinx/ext/compiler_unparse.py \
                            astropy_helpers/sphinx/ext/docscrape.py \
                            astropy_helpers/sphinx/ext/docscrape_sphinx.py \
                            astropy_helpers/sphinx/ext/numpydoc.py \
                            astropy_helpers/sphinx/ext/phantom_import.py \
                            astropy_helpers/sphinx/ext/smart_resolver.py \
                            astropy_helpers/sphinx/ext/templates/autosummary_core/base.rst \
                            astropy_helpers/sphinx/ext/templates/autosummary_core/class.rst \
                            astropy_helpers/sphinx/ext/templates/autosummary_core/module.rst \
                            astropy_helpers/sphinx/ext/tests/test_autodoc_enhancements.py \
                            astropy_helpers/sphinx/ext/tests/test_automodapi.py \
                            astropy_helpers/sphinx/ext/tests/test_automodsumm.py \
                            astropy_helpers/sphinx/ext/tests/test_docscrape.py \
                            astropy_helpers/sphinx/ext/tests/test_utils.py \
                            astropy_helpers/sphinx/ext/traitsdoc.py \
                            astropy_helpers/sphinx/ext/utils.py

git mv astropy_helpers/sphinx/* sphinx_astropy/ || true

git rm -rf --ignore-unmatch astropy_helpers *.py CONTRIBUTING.md \
                            tox.ini setup.cfg appveyor.yml .travis.yml \
                            README.rst licenses CHANGES.rst MANIFEST.in \
                            .app* .install* continuous-integration \
                            .coveragerc .gitmodules .gitignore

git clean -fxd

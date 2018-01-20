#!/bin/bash

mkdir -p sphinx_astropy_theme

git mv astropy_helpers/sphinx/themes/bootstrap-astropy sphinx_astropy_theme/bootstrap-astropy || true

git rm -rf --ignore-unmatch astropy_helpers *.py CONTRIBUTING.md \
                            tox.ini setup.cfg appveyor.yml .travis.yml \
                            README.rst licenses CHANGES.rst MANIFEST.in \
                            .app* .install* continuous-integration \
                            .coveragerc .gitmodules .gitignore
git clean -fxd

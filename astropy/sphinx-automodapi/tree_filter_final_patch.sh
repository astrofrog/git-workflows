#!/bin/bash -xe

if [[ $GIT_COMMIT == 8db2bc80a19ea09fe12a5077a44969ee46683b4a ]]; then
  cp -RP $1/sphinx_automodapi .;
else

  # If the following file exists but the templates are missing, we are in the
  # temporary phase during the initial sphinx-automodapi commits when the
  # templates hadn't been added yet - we add them back to avoid gaps.

  if [ -f "sphinx_automodapi/autodoc_enhancements.py" ]; then

    if [ ! -d "sphinx_automodapi/templates" ]; then
      echo "ADDING TEMPLATES TO $GIT_COMMIT"
      cp -RP $1/sphinx_automodapi/templates sphinx_automodapi/;
    fi

    if [ ! -f "sphinx_automodapi/tests/test_autodoc_enhancements.py" ]; then
      echo "ADDING TEST AUTODOC ENHANCEMENTS TO $GIT_COMMIT"
      cp -RP $1/sphinx_automodapi/tests/test_autodoc_enhancements.py sphinx_automodapi/tests/;
    fi

  fi

fi

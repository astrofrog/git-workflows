#!/bin/bash

mkdir -p baldrick/github
mkdir -p baldrick/github/tests

if [ -d "changebot/github" ]; then
  mv changebot/github/* baldrick/github/;
fi

if [ -f "changebot/__init__.py" ]; then
  mv changebot/__init__.py baldrick/;
fi

if [ -f "changebot/github_api.py" ]; then
  mv changebot/github_api.py baldrick/github/github_api.py;
fi

if [ -f "changebot/github_auth.py" ]; then
  mv changebot/github_auth.py baldrick/github/github_auth.py;
fi

if [ -f "changebot/tests/test_github_api.py" ]; then
  mv changebot/tests/test_github_api.py baldrick/github/tests/test_github_api.py;
fi

if [ -f "changebot/tests/test_github_auth.py" ]; then
  mv changebot/tests/test_github_auth.py baldrick/github/tests/test_github_auth.py;
fi

find . -maxdepth 1 -not -name "." -not -name ".." -not -name "setup.cfg" -not -name ".git" -not -name ".gitignore" -not -name "LICENSE" -not -name ".travis.yml" -not -name "requirements.txt" -not -name "baldrick" -exec rm -rf {} \;

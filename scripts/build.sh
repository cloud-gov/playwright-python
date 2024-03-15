#!/bin/bash

set -e

apt-get update
apt-get -y -q install \
  python3-pip \
  python3-venv

apt-get clean

# symlink python to python3 executable
ln -s "$(which python3)" /usr/bin/python

pip install --upgrade pip

# Install Playwright
pip install playwright

# Install Pytest Playwright
pip install pytest-playwright

# Install Playwright deps and Firefox browser for e2e tests
playwright install-deps
playwright install

rm -rf /var/lib/apt/lists/*

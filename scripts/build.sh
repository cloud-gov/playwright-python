#!/bin/bash

set -e

apt-get update
apt-get -y upgrade
apt-get -y -q install --no-install-recommends \
  libatomic1 \
  software-properties-common \
  gnupg

# Install Python
add-apt-repository -y ppa:deadsnakes/ppa
apt update -y
apt install -y "python3.13" "python3.13-venv" "python3.13-dev"

apt-get clean

# symlink python to python3 executable
ln -s "$(which python3.13)" /usr/bin/python
ln -sf "$(which python3.13)" /usr/bin/python3

# Upgrade pip
python -m ensurepip --upgrade --default-pip

# Install Playwright
pip install playwright

# Install Pytest Playwright
pip install pytest-playwright

# Install Playwright deps and browsers for e2e tests
playwright install-deps chromium

rm -rf /var/lib/apt/lists/*

#!/bin/bash

set -e

apt-get update
apt-get -y upgrade
apt-get -y -q install \
  wget \
  xz-utils

#install nodejs from source
wget "https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.xz"
mkdir -p /usr/local/lib/nodejs
tar -xJvf node-${NODE_VERSION}-linux-x64.tar.xz -C /usr/local/lib/nodejs
ln -s /usr/local/lib/nodejs/node-${NODE_VERSION}-linux-x64/bin/node /usr/bin/node
ln -s /usr/local/lib/nodejs/node-${NODE_VERSION}-linux-x64/bin/npm /usr/bin/npm
ln -s /usr/local/lib/nodejs/node-${NODE_VERSION}-linux-x64/bin/npx /usr/bin/npx
rm -f "node-${NODE_VERSION}-linux-x64.tar.xz"

npm install playwright
npx playwright install-deps
npx playwright install

rm -rf /var/lib/apt/lists/*
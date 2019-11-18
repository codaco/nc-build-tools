#!/bin/bash
NODE_VERSION=${2:-12.8}
BRANCH=${1:-master}

echo "Preparing to build Network Canvas suite (branch $BRANCH)"
echo "Installing correct node version..."
nvm install $NODE_VERSION
nvm use $NODE_VERSION
echo "Updating project submodules..."
git submodule init --update --recursive -f
echo "Building Network Canvas..."
sh ./build.sh Network-Canvas $BRANCH
echo "Finished building Network Canvas."
echo "Building Architect..."
sh ./build.sh Architect $BRANCH
echo "Finished building Architect."
echo "Building Server..."
sh ./build.sh Server $BRANCH
echo "Finished building Server."
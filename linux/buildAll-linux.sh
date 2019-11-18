#!/bin/bash
NODE_VERSION=${2:-12.8}
BRANCH=${1:-master}
DIRECTORY=$(cd `dirname $0` && pwd)

source ~/.nvm/nvm.sh

echo "Preparing to build Network Canvas suite (branch $BRANCH) $DIRECTORY"
echo "Installing correct node version..."
nvm install $NODE_VERSION
nvm use $NODE_VERSION
echo "Updating project submodules..."
git submodule update --init --recursive -f
echo "Building Network Canvas..."
sh "$DIRECTORY"/build.sh Network-Canvas "$BRANCH" &
echo "Finished building Network Canvas."
echo "Building Architect..."
sh "$DIRECTORY"/build.sh Architect "$BRANCH" &
echo "Finished building Architect."
echo "Building Server..."
sh "$DIRECTORY"/build.sh Server "$BRANCH" &
echo "Finished building Server."
echo "Done building all apps."
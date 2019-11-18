#!/bin/bash

DIRECTORY=$(cd `dirname $0` && pwd)

echo "Starting build of $1 on branch $2"
cd $DIRECTORY
cd ../projects/"$1"
git reset HEAD --hard
git checkout master -f
git pull
git checkout $2 -f
git pull
git submodule update --init --recursive -f
node --version
npm --version
npm install
npm run dist:linux
echo "Done!"
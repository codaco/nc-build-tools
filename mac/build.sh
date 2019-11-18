#!/bin/bash

echo "Starting build of $1 on branch $2"
cd ../Projects/"$1"
git reset HEAD --hard
git checkout master -f
git pull
git checkout $2 -f
git pull
git submodule update --init --recursive -f
node --version
npm --version
npm install
npm run dist:mac
echo "Done!"
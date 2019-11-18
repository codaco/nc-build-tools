@echo off 
echo "Starting build of %1 on branch %2"
cd %systemdrive%%homepath%\Projects\%1
git reset HEAD --hard
git checkout master -f
git pull
git checkout %2 -f
git pull
git submodule update --init --recursive -f
call npm install
call npm run dist:win
echo "Done!"
@echo off
echo "Building all Network Canvas apps"
git submodule update --init --recursive -f
cmd /c "%~dp0\build.bat Network-Canvas %1"
cmd /c "%~dp0\build.bat Architect %1"
cmd /c "%~dp0\build.bat Server %1"

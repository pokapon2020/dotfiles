@echo off

set SCRIPTDIR=%~dp0
pushd %SCRIPTDIR%

powershell ^
-NoProfile ^
-ExecutionPolicy Unrestricted ^
%SCRIPTDIR%\install.main.ps1

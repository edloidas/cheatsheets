@echo off

REM set from arguments
set NAME=%1
set EMAIL=%2

REM if arguments are not set, read from file
set CRED=%~dp0.credentials
for /f "delims== tokens=1,2" %%G in (%CRED%) do set %%G=%%H

if [%NAME%]==[] set NAME=%SAVED_NAME%
if [%EMAIL%]==[] set EMAIL=%SAVED_EMAIL%

REM if still not set, read from direct input
if [%NAME%]==[] set /p NAME="Enter user name: "
if [%EMAIL%]==[] set /p EMAIL="Enter user email: "

REM write .gitconfig
set GIT=%HOME%\.gitconfig
set GIT_TEMPLATE=%~dp0.gitconfig

echo [user]>%GIT%
echo 	email = %EMAIL%>>%GIT%
echo 	name = %NAME%>>%GIT%
type %GIT_TEMPLATE%>>%GIT%

REM save credentials
echo SAVED_NAME=%NAME%>%CRED%
echo SAVED_EMAIL=%EMAIL%>>%CRED%

echo Created .gitconfig for ( %NAME% : %EMAIL% )

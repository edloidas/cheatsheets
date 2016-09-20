@echo off

set USER=%1
set EMAIL=%2

if [%1]==[] set /p USER="Enter user name: "
if [%2]==[] set /p EMAIL="Enter user email: "

set GIT=%HOME%\.gitconfig

echo [user]>%GIT%
echo 	email = %EMAIL%>>%GIT%
echo 	name = %USER%>>%GIT%
type .gitconfig>>%GIT%

echo Created .gitconfig for ( %USER% : %EMAIL% )

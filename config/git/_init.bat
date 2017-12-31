@echo off

SET "NAME="
SET "EMAIL="
SET "WORKFLOW="

:loop
IF NOT "%1"=="" (
  echo %1
  IF "%1"=="--workflow" (
    SET WORKFLOW="true"
    SHIFT & GOTO :loop
  )
  IF "%1"=="-name" (
    IF NOT "%2"=="-email" (
      IF NOT "%2"=="--workflow" (
        SET NAME=%2
      )
    )
    SHIFT & GOTO :loop
  )
  IF "%1"=="-email" (
    IF NOT "%2"=="-name" (
      IF NOT "%2"=="--workflow" (
        SET EMAIL=%2
      )
    )
    SHIFT & GOTO :loop
  )
  SHIFT & GOTO :loop
)

REM if arguments are not set, read from file
SET CRED=%~dp0.credentials
for /f "delims== tokens=1,2" %%G in (%CRED%) do SET %%G=%%H

if [%NAME%]==[] SET NAME=%SAVED_NAME%
if [%EMAIL%]==[] SET EMAIL=%SAVED_EMAIL%
if [%WORKFLOW%]==[] SET WORKFLOW=%SAVED_WORKFLOW%
REM if still not SET, read from direct input
if [%NAME%]==[] SET /p NAME="Enter user name: "
if [%EMAIL%]==[] SET /p EMAIL="Enter user email: "
if [%WORKFLOW%]==[] (
  SET /p INPUT="Add workflow aliases (Y/N)? "
  if "%INPUT%"=="Y" SET WORKFLOW="true"
)

REM Remove quotes, if present
SET NAME=%NAME:"=%
SET EMAIL=%EMAIL:"=%

REM write .gitconfig
SET GIT=%SYSTEMDRIVE%%HOMEPATH%\.gitconfig
SET GIT_TEMPLATE=%~dp0.gitconfig
SET GIT_WORKFLOW=%~dp0workflow.gitconfig

echo [user]>%GIT%
echo 	email = %EMAIL%>>%GIT%
echo 	name = %NAME%>>%GIT%
type %GIT_TEMPLATE%>>%GIT%
IF NOT [%WORKFLOW%]==[] type %GIT_WORKFLOW%>>%GIT%

REM save credentials
echo SAVED_NAME=%NAME%>%CRED%
echo SAVED_EMAIL=%EMAIL%>>%CRED%
echo SAVED_WORKFLOW=%WORKFLOW%>>%CRED%

echo Created .gitconfig for ( %NAME% : %EMAIL% )
IF NOT [%WORKFLOW%]==[] echo Workflow: true
echo From: %GIT_TEMPLATE%
echo To:   %GIT%

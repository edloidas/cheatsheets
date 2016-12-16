@echo off

set ATOM_HOME=%HOMEPATH%\.atom

for %%f in (config.cson, keymap.cson, styles.less) do xcopy "%%~f" %ATOM_HOME% /Y /F

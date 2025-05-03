@echo off
cd %0/../
if exist "%CD%\Data\" RD /S /Q "%CD%\Data\"
MD "%CD%\Data\"
LGPO.exe /b %CD%\Data\
echo ...
echo Done
pause
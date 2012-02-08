
@echo off
rem This is made by DeadMonkeyX 2010
title RDP Session Disconnect - By DeadMonkeyX v0.1
echo                   RDP Session Disconnect v0.1
echo =============================================================
set server=
set /p server=Enter server IP: %=%
echo you have entered %server% if that is wrong press CTRL+C
ping localhost -n 2 >nul

:do
cls
echo                    %server%
echo =============================================================
qwinsta /SERVER:%server%
echo =============================================================
rem *select session*
set sessionID=
set /p sessionID=Enter the ID of the session you wanna kill: %=%
rwinsta /SERVER:%server% %sessionID%
echo %sessionID% was killed!
echo.
pause
cls
echo 1. Do you want to kill more sessions on %server% ?
echo 2. QUIT
set /p answr=Choose a number(1-2):
set answr=%answr:~0,1%
if "%answr%"=="1" goto do
if "%answr"=="2" goto exit

:exit
exit
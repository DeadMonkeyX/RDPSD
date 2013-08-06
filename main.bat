@echo off
rem Written by dmonk 2010
rem
rem This tool is made because of the problem with unlicenced windows servers
rem if you dont have a Terminal Services or Remote Desktop Services License
rem on your windows based server you are are limited to have only 2 remote desktop sessions
rem And if you disconnect the wrong way the server will keep a session "running" that session
rem counts as 1 because it thinks the user still is using it. 
rem This tool can close those sessions.
rem
rem it has been tested on Win2k3 Win2k8R2 and works perfectly. 
rem 
rem
title RDP Session Disconnect by dm0nk
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
rem The sessions will be listed and you can now select one to kill
set sessionID=
set /p sessionID=Enter the ID of the session you wanna kill: %=%
rwinsta /SERVER:%server% %sessionID%
echo %sessionID% was killed!
echo.
pause
cls
echo 1. Kill more sessions %server% ?
echo 2. Quit
set /p answr=Choose a number(1-2):
set answr=%answr:~0,1%
if "%answr%"=="1" goto do
if "%answr"=="2" goto exit

:exit
exit

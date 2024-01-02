@echo off
setlocal enabledelayedexpansion

rem color 3f
title BlueStacksFullInstaller
rem mode 60, 20
cd /d "%~dp0"
set VERSION=0
set tmp=0

echo.
echo.       The following versions were found
echo.
echo.**************************************************
echo.
for /f  "delims=" %%f in ('dir /B BlueStacksFullInstaller*.exe') do (
    set /a tmp+=1
    set "version!tmp!=%%f"
)
for /l %%f in (1,1,%tmp%) do (
    echo. %%f.!version%%f!
    echo.
)
echo.**************************************************
echo.

if %tmp%==1 (
    set VERSION=%version1%
    goto :menu
) 
set /p choice=Select one and press Enter:
set VERSION=!version%choice%!
call :menu


:menu
cls
echo.
echo.You chose:
echo.%VERSION%
echo.
echo.**************************************************
echo.         Select the Android version of 
echo.        BlueStacks 5 you want to install
echo.
echo.                1.Android 7 32-bit
echo.
echo.                2.Android 7 64-bit
echo.
echo.                3.Android 9 64-bit
echo.
echo.                4.Android 11 64-bit
echo.
echo.**************************************************
echo.

choice /C:1234 /N
set _erl=%errorlevel%
if %_erl%==1 call :Nougat_32
if %_erl%==2 call :Nougat_64
if %_erl%==3 call :Pie_64
if %_erl%==4 call :Rvc_64


:Nougat_32
%VERSION% --defaultImageName Nougat32 --imageToLaunch Nougat32
exit


:Nougat_64
%VERSION% --defaultImageName Nougat64 --imageToLaunch Nougat64
exit


:Pie_64
%VERSION% --defaultImageName Pie64 --imageToLaunch Pie64
exit


:Rvc_64
%VERSION% --defaultImageName Rvc64 --imageToLaunch Rvc64
exit

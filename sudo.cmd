@echo off
:: BatchGotAdmin
::-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::--------------------------------------
REM cmd /c psexec64.exe -s -i cmd.exe
where psexec64.exe > nul 2>&1
if %ERRORLEVEL% EQU 0 (
    set "found=1"
    cmd /c psexec64.exe -s -i cmd.exe
) else if %ERRORLEVEL% EQU 1 (
    echo.--- Error: psexec64.exe not found in your PATH!
    echo.--- Please check the following:
    echo.
    for %%A in ("%path:;=";"%") do (
        echo.%%~A
    )
    pause
)


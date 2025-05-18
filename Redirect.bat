@echo off
title Redirect Checker.TSMSMT
color 70
mode 45,20
title Redirect.TSMSMT

:menu
cls
echo =============================================
echo            Advanced Web Checker
echo =============================================
echo 1. Check Redirects
echo 2. View HTTP Headers
echo 3. Check Domain IP
echo 4. Exit
echo =============================================
set /p choice=Select an option (1-4): 

if "%choice%"=="1" goto redirect
if "%choice%"=="2" goto headers
if "%choice%"=="3" goto checkip
if "%choice%"=="4" exit

echo Invalid option! Try again.
pause
goto menu

:redirect
cls
echo =============================================
echo              Redirect Checker
echo =============================================
echo Enter website URL (e.g., https://example.com)
set /p site=URL: 

if "%site%"=="" (
    echo No URL entered! Try again.
    pause
    goto redirect
)

echo.
echo Checking Redirects...
echo.


for /f "tokens=2 delims= " %%A in ('curl --head --location --silent "%site%" ^| findstr /R "^HTTP/"') do set status=%%A


set "finalLocation="
for /f "tokens=2 delims= " %%B in ('curl --head --location --silent "%site%" ^| findstr /I "^Location:"') do set finalLocation=%%B

echo =============================================
echo HTTP Status Code: %status%
if defined finalLocation (
    echo Final Redirect URL: %finalLocation%
) else (
    echo No Redirect Found.
)
echo =============================================
echo.
echo Press any key to return to menu...
pause >nul
goto menu

:headers
cls
echo =============================================
echo             HTTP Headers Viewer
echo =============================================
echo Enter website URL (e.g., https://example.com)
set /p site=URL: 

if "%site%"=="" (
    echo No URL entered! Try again.
    pause
    goto headers
)

echo.
echo Fetching HTTP Headers...
echo =============================================
curl -Is "%site%"
echo =============================================

echo.
echo Press any key to return to menu...
pause >nul
goto menu

:checkip
cls
echo =============================================
echo             IP Address Checker
echo =============================================
echo Enter domain name (e.g., example.com)
set /p domain=Domain: 

if "%domain%"=="" (
    echo No domain entered! Try again.
    pause
    goto checkip
)

echo.
echo Checking IP for %domain%...
echo =============================================
nslookup %domain%
echo =============================================

echo.
echo Press any key to return to menu...
pause >nul
goto menu

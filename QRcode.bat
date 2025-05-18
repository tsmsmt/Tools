@echo off
title QR Code Generator.TSMSMT
color 70
mode 44,21

:loop
cls
echo ============================================
echo           TSMSMT QR Code Generator
echo ============================================

:: اضافه کردن چند خط خالی برای پایین آوردن QR Code
echo.
echo.
echo.

:: گرفتن ورودی از کاربر
echo Enter text or URL for QR Code:
set /p site=URL: 

if "%site%"=="" (
    echo No input entered! Try again.
    pause
    goto loop
)

cls
echo ============================================
echo           TSMSMT QR Code Generator
echo ============================================

:: اضافه کردن چند خط خالی برای بهتر دیده شدن
echo.
echo.
echo.

:: نمایش QR Code
echo.
curl -s "qrenco.de/%site%"

echo.
echo ============================================
echo Press any key to generate another QR Code...
pause >nul
goto loop

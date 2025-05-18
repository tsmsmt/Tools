@echo off
title Token Counter.TSMSMT
color 70
mode 40,20

:loop
cls
echo ========================================
echo           TSMSMT Token Counter
echo ========================================
echo Enter a sentence:
set /p sentence=

if "%sentence%"=="" (
    echo No input detected! Try again.
    pause
    goto loop
)

:: ذخیره جمله در یک متغیر موقتی
set count=0

:: حلقه برای خواندن هر کلمه از جمله
for %%A in (%sentence%) do (
    set /a count+=1
)

:: نمایش نتیجه
echo ========================================
echo Total Tokens Found: %count%
echo ========================================

echo.
echo Press any key to enter another sentence...
pause >nul
goto loop

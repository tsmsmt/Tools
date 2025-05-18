@echo off
chcp 65001 >nul
mode 42,20
title Weather.TSMSMT
color 70

:loop
cls
echo ==========================================
echo            Weather Information
echo ==========================================
echo.
set /p location= Enter Country/City Name: 

:: دریافت اطلاعات و ذخیره در فایل موقت
curl -s wttr.in/%location%?0 > weather.txt

:: استخراج فقط بخش مهم (شرایط جوی، دما، باد، دید)
findstr /R "^. .*.°C" weather.txt > filtered_weather.txt

cls
echo ==========================================
echo       Weather Report for %location%
echo ==========================================
type filtered_weather.txt
echo ==========================================

:: پاک کردن فایل‌های موقت
del weather.txt
del filtered_weather.txt
color 70
echo.
echo Press any key to check another location...
pause >nul
goto loop

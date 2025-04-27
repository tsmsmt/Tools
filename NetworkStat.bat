@echo off
mode 42,20
color 70
title Network.TSMSMT
echo Loading Network Infomation "\>_</"
:loop
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "SSID" ^| findstr /v "BSSID"') do set ssid=%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "Description"') do set adapter=%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "State"') do set state=%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "Signal"') do set signal=%%a
ping -n 10 8.8.8.8>%temp%\ping.txt
for /f "tokens=4 delims==" %%a in ('type %temp%\ping.txt ^| find "Average"') do set ping=%%a
for /f "tokens=10 delims= " %%a in ('type %temp%\ping.txt ^| find "Lost"') do set ploss=%%a
for /f "tokens=2 delims= " %%a in ('netstat -e ^| find "Bytes"') do set rbytes=%%a
for /f "tokens=3 delims= " %%a in ('netstat -e ^| find "Bytes"') do set sbytes=%%a
cls
echo.
echo   Network:
echo   --------
echo   SSID:%ssid%
echo   State:%state%
echo   Signal:%signal%
echo   NIC:%adapter%
echo. ~~~~~~~~
echo   Speed:
echo   ------
echo   Ping:%ping%
echo   PacketLoss:%ploss%
echo   Send:%sbytes% B
echo   Received:%rbytes% B
goto loop
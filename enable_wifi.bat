@echo off
:: ======= KHỐI TỰ-THĂNG QUYỀN =======
net session >nul 2>&1
if %errorlevel% NEQ 0 (
    echo [!] Dang yeu cau quyen Administrator...
    powershell -Command "Start-Process '%~f0' -ArgumentList '%*' -Verb RunAs"
    exit /b
)
:: ======= PHẦN CHÍNH =======
set "wifiName=Wi-Fi"
set "wifiSSID=a"

netsh interface set interface name="%wifiName%" admin=enabled
timeout /t 5 /nobreak >nul
netsh wlan connect name="%wifiSSID%"

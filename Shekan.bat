@echo off
set INTERFACE=Lan
set DNS_IP=185.51.200.2

netsh interface ipv4 show dnsservers name="%INTERFACE%" | findstr "%DNS_IP%" >nul
if %errorlevel%==0 (    
    netsh interface ipv4 set dnsservers name="%INTERFACE%" source=dhcp  
    echo Shekan Is Remove.

) else (
    netsh interface ipv4 set dns name="%INTERFACE%" static 185.51.200.2
    netsh interface ipv4 add dns name="%INTERFACE%" 178.22.122.100 index=2
    echo Shekan Is Set.
)
pause


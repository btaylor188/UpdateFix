@echo off
rem Remove Solar Winds Software
echo "Removing Solarwinds Software"
echo "Removing MSP Cache Service"
"C:\Program Files (x86)\SolarWinds MSP\CacheService\unins000.exe" /silent
echo "Removing Patch Management Engine"
"C:\Program Files (x86)\SolarWinds MSP\PME\unins000.exe" /silent
echo "Removing MSP RPC Server"
"C:\Program Files (x86)\SolarWinds MSP\RpcServer\unins000.exe" /silent
echo "Removing MSP Software Probe"
wmic product where name="Windows Software Probe" call uninstall /nointeractive
echo "Removing Windows Agent"
wmic product where name="Windows Agent" call uninstall /nointeractive 
echo "Removing Windows Update Registry Keys"
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f
echo "Updating Group Policy"
gpupdate /force
echo "Schedule Reboot?"
choice 
if errorlevel 1 goto reboot
if errorlevel 2 goto exit
:reboot
echo "Scheduling Reboot at 11:59 PM"
schtasks /create /sc once /tn "Reboot" /tr "shutdown -r" /st 23:59

:exit
exit

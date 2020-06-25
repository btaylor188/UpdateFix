@echo off

"C:\Program Files (x86)\SolarWinds MSP\CacheService\unins000.exe" /silent
"C:\Program Files (x86)\SolarWinds MSP\PME\unins000.exe" /silent
"C:\Program Files (x86)\SolarWinds MSP\RpcServer\unins000.exe" /silent
wmic product where name ="Windows Software Probe" call uninstall /nointeractive
wmic product where name ="Windows Agent" call uninstall /nointeractive 
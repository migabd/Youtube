@echo off
:: Executa o PowerShell como administrador para alterar o DNS
powershell -Command "Start-Process PowerShell -ArgumentList '-ExecutionPolicy Bypass -NoProfile -Command \"& {
$interface = Get-NetAdapter | Where-Object { $_.Status -eq \"Up\" } | Select-Object -First 1 -ExpandProperty Name;
Set-DnsClientServerAddress -InterfaceAlias $interface -ServerAddresses (\"94.140.14.14\", \"94.140.15.15\");
}\"' -Verb RunAs"
pause

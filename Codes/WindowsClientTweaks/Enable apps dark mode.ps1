###This script will enable app dark mode for all Windows 11 apps supporting this theme mode (including ThisIsWin11).
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0 -Type Dword -Force




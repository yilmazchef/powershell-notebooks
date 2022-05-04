
New-VM -Confirm -Generation 2 -MemoryStartupBytes 4GB -Name "AutoCreatedVM" -NewVHDPath "C:\Sandbox\VM\AutoCreatedDisk.vhdx" -NewVHDSizeBytes 40GB -Path "C:\Sandbox\VM\AutoCreatedVM" -SwitchName "Default Switch" 
Add-VMDvdDrive -VMName "AutoCreatedVM" -Path "C:\ISOs\Win10.iso"
Start-VM -Name "AutoCreatedVM"
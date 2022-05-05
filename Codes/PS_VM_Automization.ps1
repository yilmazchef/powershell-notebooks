function Create-New-VM($Name, $VM_Directory, $RAM, $DISK_Capacity, $DISK_Path, $ISO, $Switch) {

    New-VM -Confirm -Generation 2 -MemoryStartupBytes $RAM -Name $Name -NewVHDPath $DISK_Path -NewVHDSizeBytes $DISK_Capacity -Path $VM_Directory -SwitchName "Default Switch" 
    Add-VMDvdDrive -VMName $Name -Path $ISO
    Start-VM -Name $Name
}

function Auto-Create-A-Random-VM() {
    
    Param(
        [String]$SwitchName,
        [String]$ISO
    )
  
    $RANDOM_NO = [Math]::Round((Get-Date).ToFileTimeUTC() / 10000)
    $Name = "VM_$RANDOM_NO"
    $RAM = 4GB
    $DISK_Capacity = 100GB
    $DISK_Path = "C:\Virtual Machines\AutoVMs\Disk\"
    $VM_Directory = "C:\Virtual Machines\AutoVMs\"
    
  

    New-VM -Confirm -Generation 2 -MemoryStartupBytes $RAM -Name $Name -NewVHDPath $DISK_Path -NewVHDSizeBytes $DISK_Capacity -Path $VM_Directory -SwitchName $SwitchName 
    Add-VMDvdDrive -VMName $Name -Path $ISO
    Start-VM -Name $Name
}
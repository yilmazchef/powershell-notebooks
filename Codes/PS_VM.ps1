New-VM -Confirm -Generation 2 -MemoryStartupBytes 4GB -Name "AutoCreatedVM" -NewVHDPath "C:\Sandbox\VM\AutoCreatedDisk.vhdx" -NewVHDSizeBytes 40GB -Path "C:\Sandbox\VM\AutoCreatedVM" -SwitchName "Default Switch" 
Add-VMDvdDrive -VMName "AutoCreatedVM" -Path "C:\ISOs\Win10.iso"
Start-VM -Name "AutoCreatedVM"

# 2nd way, better way.
# Creating a new virtual machine on Hyper V
$newVM_splat = @{
    # Set the name of the new VM.
    Name = 'L1-VM'
    # Set the VM's generation version to generation 1.
    Generation = 2
    # Set the VM's memory size to 4GB
    MemoryStartupBytes = 4GB
    # Set the boot option to CD.
    BootDevice = 'CD'
    # Set the virtual switch called vNAT the VM will use to connect.
    SwitchName = 'vNAT'
    # Set the location where to create the new VM.
    Path = 'C:\Hyper-V\L1-VM'
    # Set the location where to create the new VM's virtual hard disk.
    NewVHDPath = 'C:\Hyper-V\L1-VM\VHD\L1-VM.vhdx'
    # Set the new virtual hard disk size to 100GB
    NewVHDSizeBytes = 100GB
}
# Create the new VM.
New-VM @newVM_splat
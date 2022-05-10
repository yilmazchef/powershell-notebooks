function New-ADServer() {

    Param(
        $Name, 
        $Dir, 
        $Ram, 
        $Disk, 
        $Image, 
        $Switch
    )

    New-VM -Confirm -Generation 2 -MemoryStartupBytes $Ram -Name $Name -NewVHDPath $Disk -NewVHDSizeBytes 100GB -Path $Dir -SwitchName "Default Switch" 
    Add-VMDvdDrive -VMName $Name -Path $Image
    # Start-VM -Name $Name
}

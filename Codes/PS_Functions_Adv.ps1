function Generate-VM(){

    $ram_capacity = Read-Host "RAM capacity for each VM"
    $disk_capacity = Read-Host "Disk capacity for each VM"
    $switch_name = Read-Host "Network switch name for each VM"
    
    for ( $index = 0; $index -lt 3; $index = $index + 1) {
    
        $vhd_path = "C:\Sandbox\VM\VM_Disk_$index.vhdx"
    
        if(Test-Path $vhd_path){
            Write-Error "The VM already exists.."
        } else {
            New-VM -Confirm -Generation 2 -MemoryStartupBytes $ram_capacity -Name "VM_$index" -NewVHDPath "C:\Sandbox\VM\VM_Disk_$index.vhdx" -NewVHDSizeBytes $disk_capacity -Path "C:\Sandbox\VM\VM_$index" -SwitchName $switch_name 
        }
    }

}


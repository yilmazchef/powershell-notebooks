<#
.SYNOPSIS
    Creates a new Windows Active Directory server.
.DESCRIPTION
    Creates a new Windows Active Directory server.
.NOTES
    Information or caveats about the function e.g. 'This function is not supported in Linux'
.LINK
    https://github.com/yilmazchef/powershell-notebooks/blob/main/Codes/PS_Windows_Server_WM.ps1
.EXAMPLE
    # 1.Step -> Download Win Server ISO
    Invoke-WebRequest -Uri "https://software-download.microsoft.com/download/sg/20348.1.210507-1500.fe_release_SERVER_EVAL_x64FRE_en-us.iso" -UseBasicParsing -OutFile "WinServer.iso"
    # 2.Step -> Create new Win Server VM
    New-ADServer -Name "MyADServer" -Dir "C:\VMs\" -Ram 4GB -Disk 60GB -Image "WinServer.iso" 
#>

{0}
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

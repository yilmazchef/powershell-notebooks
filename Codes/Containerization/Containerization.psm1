# Activates the windows subsystem for linux feature from windows
function Activate-WSL() {
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
}

# Activates the virtual machine plaftorm feature from windows
function Activate-Virtualization() {
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
}

# download WSL patch and start installation
function Patch-WSL() {
    Invoke-WebRequest -Uri "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi" -OutFile "WSLPatch.msi" -UseBasicParsing 
    .\WSLPatch.msi
}

# Sets the default WSL version to 2
function Update-WSLVersion() {
    wsl --set-default-version 2
}

# downloads Ubuntu image and install it on Windows Subsystem for Linux
function Install-WSLUbuntu() {
    Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile Ubuntu.appx -UseBasicParsing
    Add-AppxPackage .\Ubuntu.appx
}

# downloads Kali image and install it on Windows Subsystem for Linux
function Install-WSLKali() {
    Invoke-WebRequest -Uri https://aka.ms/wsl-kali-linux-new -OutFile Kali.appx -UseBasicParsing
    Add-AppxPackage .\Kali.appx
}

# install docker backend apps and frontend management tool
function Install-Docker() {
    winget install Docker.DockerDesktop
}

function New-DockerSandbox() {
    
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

    return $Name
}

function Enable-NestedVirtualization() {

    Param(
        [String]$VMName
    )

    if ($VMName -eq $null -or $VMName -eq "") {
        $VMName = New-DockerSandbox -SwitchName "Default Switch" -ISO "C:\ISOs\Win10.iso"
    }

    Set-VMProcessor -VMName $Docker -ExposeVirtualizationExtensions $true

}
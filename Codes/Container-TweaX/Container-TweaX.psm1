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

    # activate Virtualization
    Activate-Virtualization

    # activate WSL
    Activate-WSL
    Patch-WSL
    Update-WSLVersion

    Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/microsoft/Windows-Containers/Main/helpful_tools/Install-DockerCE/install-docker-ce.ps1" -o install-docker-ce.ps1
    .\install-docker-ce.ps1
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

function Get-TerminalSession {
    DO {
        Clear-Host
        Write-Host "~~~~~~~~~~~~~~~~~~ Menu Title ~~~~~~~~~~~~~~~~~~" -ForegroundColor Cyan
        Write-Host "1: Enter 1 to select PowerShell"
        Write-Host "2: Enter 2 to select Bash"
        Write-Host
         
        $input = (Read-Host "Please make a selection").ToUpper()
        switch ($input) {
            '1' { $shellType = "/usr/bin/pwsh" }
            '2' { $shellType = "/bin/bash" }
        }
    } While ($input -NotIn 1..2)
    return $shellType
}

function New-TerminalSession() {
 
    $results = $(docker ps -q --filter ancestor=mcr.microsoft.com/azure-cloudshell)
    If ($null -ne $results) {
        Write-Host "container running..."
        Write-Host "connecting to container..."
        docker exec -it $results bash
    }
    Else {
        Write-Host "container not running"
        Write-Host "Updating container image..."
        Write-Host "Picking Shell Type"
        
        $StartShellType = Get-TerminalSession
        $default = "E:\azrshell"
        if (!($ScriptsLocation = Read-Host "Enter the path where your local scripts are located. Press Enter to accept the default = [$default]")) { $ScriptsLocation = $default }
        Write-Host "updating container image..."
        docker pull mcr.microsoft.com/azure-cloudshell:latest
        Write-Host "Starting container and connecting your shell..."
        Write-Host "Mapping your scripts directory in the container home drive to " $ScriptsLocation "..."
        Write-Host
        Write-Host "___________________________________________________________"
        Write-Host
        docker run -it -v ""$ScriptsLocation':/usr/cloudshell/scripts'"" mcr.microsoft.com/azure-cloudshell $StartShellType
    }
}

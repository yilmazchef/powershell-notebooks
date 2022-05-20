# Activates the windows subsystem for linux feature from windows
function Activate-WSL(){
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
}

# Activates the virtual machine plaftorm feature from windows
function Activate-Virtualization(){
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
}

# download WSL patch and start installation
function Patch-WSL(){
    Invoke-WebRequest -Uri "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi" -OutFile "WSLPatch.msi" -UseBasicParsing 
    .\WSLPatch.msi
}

# Sets the default WSL version to 2
function Update-WSLVersion(){
    wsl --set-default-version 2
}

# downloads Ubuntu image and install it on Windows Subsystem for Linux
function Install-WSLUbuntu(){
    Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile Ubuntu.appx -UseBasicParsing
    Add-AppxPackage .\Ubuntu.appx
}

# downloads Kali image and install it on Windows Subsystem for Linux
function Install-WSLKali(){
    Invoke-WebRequest -Uri https://aka.ms/wsl-kali-linux-new -OutFile Kali.appx -UseBasicParsing
    Add-AppxPackage .\Kali.appx
}

# install docker backend apps and frontend management tool
function Install-Docker(){
    winget install Docker.DockerDesktop
}

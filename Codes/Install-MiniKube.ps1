# Download and run the installer for the latest release.
New-Item -Path 'C:\Program Files\' -Name 'MiniKube' -ItemType Directory -Force
Invoke-WebRequest -OutFile 'C:\Program Files\MiniKube\minikube.exe' -Uri 'https://github.com/kubernetes/minikube/releases/latest/download/minikube-windows-amd64.exe' -UseBasicParsing ´

# Add the minikube.exe binary to your PATH.
$oldPath = [Environment]::GetEnvironmentVariable('Path', [EnvironmentVariableTarget]::Machine)
if ($oldPath.Split(';') -inotcontains 'C:\Program Files\MiniKube\') {
 `
    [Environment]::SetEnvironmentVariable('Path', $('{0};C:\Program Files\MiniKube\' -f $oldPath), [EnvironmentVariableTarget]::Machine) `

}

function Install-WinGet() {

    $hasPackageManager = Get-AppPackage -name 'Microsoft.DesktopAppInstaller'

    if (!$hasPackageManager) {
        Add-AppxPackage -Path 'https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx'
    
        $releases_url = 'https://api.github.com/repos/microsoft/winget-cli/releases/latest'
    
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        $releases = Invoke-RestMethod -uri $releases_url
        $latestRelease = $releases.assets | Where { $_.browser_download_url.EndsWith('msixbundle') } | Select -First 1
    
        "Installing winget from $($latestRelease.browser_download_url)"
        Add-AppxPackage -Path $latestRelease.browser_download_url
    }

}

function Import-Docs() {

    Write-Host "Update is started.."

    $i = 0
    Get-ChildItem -Recurse -Filter *.md | ForEach-Object {
        pandoc -o ($_.FullName -Replace ".md",".docx") $_.FullName
        Write-Progress -Activity "Descending" -Status "$i%" -PercentComplete $i
        $i++
    }
    
    
    Write-Host "Update is complete.."

}

Import-Docs

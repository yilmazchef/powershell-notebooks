function Get-Web-Items {
    param(
        [Parameter(Mandatory = $true)]
        $url, 
        $destinationFolder = "$env:USERPROFILE\Downloads", 
        [switch]$includeStats
    )
    $destination = Join-Path $destinationFolder ($url | Split-Path -Leaf)
    $start = Get-Date
    Invoke-WebRequest $url -OutFile $destination
    $elapsed = ((Get-Date) - $start).ToString('hh\:mm\:ss')
    $totalSize = (Get-Item $destination).Length | Get-FileSize
    if ($includeStats.IsPresent) {
        [PSCustomObject]@{Name = $MyInvocation.MyCommand; TotalSize = $totalSize; Time = $elapsed }
    }
    Get-Item $destination | Unblock-File
}

function Get-Youtube-Playlist {
    Param (
        #.PARAMETER Playlisturl = The URL of the youtube playlist.
        [Parameter(Mandatory = $True, Position = 0)]
        [String]
        $URLPlaylist
    )
    $VideoUrls = (invoke-WebRequest -uri $URLPlaylist).Links
    $DownloadLinks = @()
    $x = 0
    While ($y -lt $VideoUrls.Count) {
        if ($VideoUrls[$y].innerhtml -notmatch 'SPAN class') {
            $DownloadLinks += ('www.youtube.com' + $videourls[$y].href)
            $y++
        }
        Else {
            $y++
        }
    }

    Foreach ($link in $DownloadLinks) {
        $Destination = "$env:USERPROFILE\Downloads"
        youtube-dl.exe $link -o "$Destination\%(title)s.%(ext)s"
    }
}

function Get-Youtube-Playlist {
    Param (
        #.PARAMETER Playlisturl = The URL of the youtube playlist.
        [Parameter(Mandatory = $True, Position = 0)]
        [String]$URLPlaylist
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
        D:\Scripts\youtube-dl $link -o "$Destination\%(title)s.%(ext)s"
    }
}

$URL = Read-Host 'Please Enter playlist URL '
Get-YoutubePlaylist -Playlisturl $URL


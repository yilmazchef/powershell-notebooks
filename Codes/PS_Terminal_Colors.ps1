$colors = [enum]::GetValues([System.ConsoleColor])
Foreach ($bgcolor in $colors){
    Foreach ($fgcolor in $colors) {
        Write-Host "$fgcolor|"  -ForegroundColor $fgcolor -BackgroundColor $bgcolor -NoNewLine
    }
    Write-Host " on $bgcolor"
}

[System.Enum]::GetValues('ConsoleColor') |
ForEach-Object { Write-Host $_ -ForegroundColor $_ }

$DefaultForeground = (Get-Host).UI.RawUI.ForegroundColor
$DefaultBackground = (Get-Host).UI.RawUI.BackgroundColor
function Set-Console-Colors()
{
    Param
    (
        [string]$Foreground = "",
        [string]$Background = ""
    )

    $ValidColors = "black","blue","cyan","darkblue" ,"darkcyan","darkgray",
        "darkgreen","darkmagenta","darkred","darkyellow","gray","green",
        "magenta","red","white","yellow";

    $Foreground = $Foreground.ToLower()
    $Background = $Background.ToLower()

    if ( $Foreground -eq "" )
    {
        $Foreground = $DefaultForeground
    }
    if ( $Background -eq "" )
    {
        $Background = $DefaultBackground
    }

    if ( $ValidColors -contains $Foreground -and
         $ValidColors -contains $Background )
    {
        $a = (Get-Host).UI.RawUI
        $a.ForegroundColor = $Foreground
        $a.BackgroundColor = $Background
    }
    else 
    {
        write-host "Foreground/Background Colors must be one of the following:"
        $ValidColors 
    }
}
set-alias set-colors Set-Colors
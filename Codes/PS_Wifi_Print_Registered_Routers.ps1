(netsh wlan show interface | Select-String SSID)[0] | ForEach-Object {
    [String]$SSID = $_
    $SSID = $SSID.replace("SSID", "").replace(":", "").trim()
    $SSID
    netsh wlan show profile name=$SSID key=clear
}
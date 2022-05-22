function Get-NetworkConfigs(){
    Get-NetIPConfiguration
}

function Get-ADNetworkConfigs(){
    Get-ADDomainController
}

function Get-DHCNetworkConfigs(){
    Get-DhcpServerInDC
}

function Ping-Sweep(){
    (1..254) | % {$ip="10.0.40.$_"; Write-output "$IP  $(test-connection -computername "$ip" -quiet -count 1)"}
}

function Reverse-Lookup(){
    (1..254) | % {$ip="10.0.40.$_"; Write-output "$IP  $( Resolve-DnsName $ip -ErrorAction Ignore |select -exp NameHost )  "}    
}

function Get-CombinedConfigs(){
    (1..254) | % {$ip="10.0.40.$_"; Write-output "$IP  $(test-connection -computername "$ip" -quiet -count 1)  $( Resolve-DnsName $ip -ErrorAction Ignore |select -exp NameHost )  "}  
}


Get-CombinedConfigs
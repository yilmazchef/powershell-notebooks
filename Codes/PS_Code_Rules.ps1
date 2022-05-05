function PrintHello(){
    Write-Host "Hello World."    
}

function Get-Square($number){
    $result = $number * $number
    return $result
}

function Get-Sum($number1, $number2){
    $result = $number1 +  $number2
    return $result
}

# ((Get-Sum 10 20) + (Get-Sum 100 200)) 


function SendMessage($from, $to, $subject){
    Write-Host "Message from $from to $to : $subject"
}


# SYNTAXIS

function NameOfTheFunction($param1, $param2, $param3, $paramx){
    # add your code here..    
}

# The Get-Square function returns the square (x^2) of the value provided.
function Get-Square([int]$value) {
    $result = $value * $value
    Write-Host $result
}

function Get-Numbers([int]$n1, [int]$n2, [int]$n3){
    Write-Host $n1
    Write-Host $n2
    Write-Host $n3
}

Get-Square 2

Get-Numbers 1 2 3



<#
.SYNOPSIS
    Returns the sum of 2 numbers.

.DESCRIPTION
    Returns the sum of 2 numbers. 

.PARAMETER number1
    The first number.

.PARAMETER number2
    The second number.

.EXAMPLE
     Get-Sum 10 20

.EXAMPLE
     Get-Sum 10.10 20.20

.INPUTS
    Float

.OUTPUTS
    Float

.NOTES
    Author:  Yilmaz Mustafa a.k.a. Ch€f
    Website: http://yilmazchef.github.io
    Twitter: @_yilmaz_mustafa
#>
function Get-Sum([Float]$number1, [Float]$number2){
    return ($number1 + $number2)
}

function Get-Sum-V2(){
    Param(
        [Float]$number1, 
        [Float]$number2
    )

    return ($number1 + $number2)
}

<#
.SYNOPSIS
    Returns the substraction of 2 numbers.

.DESCRIPTION
    Returns the substraction of 2 numbers. Number1 - Number2

.PARAMETER number1
    The first number.

.PARAMETER number2
    The second number.

.EXAMPLE
     Get-Sub 40 20

.EXAMPLE
     Get-Sub 40.40 20.20

.INPUTS
    Float

.OUTPUTS
    Float

.NOTES
    Author:  Yilmaz Mustafa a.k.a. Ch€f
    Website: http://github.com/yilmazchef/powershell-notebooks/Codes/calculator_doc.md
    Twitter: @_yilmaz_mustafa
#>
function Get-Sub([Float]$number1, [Float]$number2){
    return ($number1 - $number2)
}

<#
.SYNOPSIS
    Returns the sum of 2 numbers.

.DESCRIPTION
    Returns the sum of 2 numbers. 

.PARAMETER number1
    The first number.

.PARAMETER number2
    The second number.

.EXAMPLE
     Get-Sum 10 20

.EXAMPLE
     Get-Sum 10.10 20.20

.INPUTS
    Float

.OUTPUTS
    Float

.NOTES
    Author:  Yilmaz Mustafa a.k.a. Ch€f
    Website: http://yilmazchef.github.io
    Twitter: @_yilmaz_mustafa
#>
function Get-Sum([Float]$number1, [Float]$number2){
    return ($number1 + $number2)
}

<#
.SYNOPSIS
    Returns the multiplication of 2 numbers.

.DESCRIPTION
    Returns the multiplication of 2 numbers.

.PARAMETER number1
    The first number.

.PARAMETER number2
    The second number.

.EXAMPLE
     Get-Mul 5 4

.EXAMPLE
     Get-Mul 4.40 5.50

.INPUTS
    Float

.OUTPUTS
    Float

.NOTES
    Author:  Yilmaz Mustafa a.k.a. Ch€f
    Website: http://github.com/yilmazchef/powershell-notebooks/Codes/calculator_doc.md
    Twitter: @_yilmaz_mustafa
#>
function Get-Mul([Float]$number1, [Float]$number2){
    return ($number1 * $number2)
}

<#
.SYNOPSIS
    Returns the division of 2 numbers.

.DESCRIPTION
    Returns the division of 2 numbers. Number1 / Number2

.PARAMETER number1
    The first number.

.PARAMETER number2
    The second number.

.EXAMPLE
     Get-Mul 5 4

.EXAMPLE
     Get-Mul 4.40 5.50

.INPUTS
    Float

.OUTPUTS
    Float

.NOTES
    Author:  Yilmaz Mustafa a.k.a. Ch€f
    Website: http://github.com/yilmazchef/powershell-notebooks/Codes/calculator_doc.md
    Twitter: @_yilmaz_mustafa
#>
function Get-Div([Float]$number1, [Float]$number2){
    return ($number1 / $number2)
}

$n1 = Read-Host "Number1"
$n2 = Read-Host "Number2"
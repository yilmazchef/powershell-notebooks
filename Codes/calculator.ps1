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
    Int

.OUTPUTS
    Int

.NOTES
    Author:  Yilmaz Mustafa a.k.a. Ch€f
    Website: http://yilmazchef.github.io
    Twitter: @_yilmaz_mustafa
#>
function Get-Sum([Int]$number1, [Int]$number2){
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
    Int

.OUTPUTS
    Int

.NOTES
    Author:  Yilmaz Mustafa a.k.a. Ch€f
    Website: http://github.com/yilmazchef/powershell-notebooks/Codes/calculator_doc.md
    Twitter: @_yilmaz_mustafa
#>
function Get-Sub([Int]$number1, [Int]$number2){
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
    Int

.OUTPUTS
    Int

.NOTES
    Author:  Yilmaz Mustafa a.k.a. Ch€f
    Website: http://yilmazchef.github.io
    Twitter: @_yilmaz_mustafa
#>
function Get-Sum([Int]$number1, [Int]$number2){
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
    Int

.OUTPUTS
    Int

.NOTES
    Author:  Yilmaz Mustafa a.k.a. Ch€f
    Website: http://github.com/yilmazchef/powershell-notebooks/Codes/calculator_doc.md
    Twitter: @_yilmaz_mustafa
#>
function Get-Mul([Int]$number1, [Int]$number2){
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
    Int

.OUTPUTS
    Int

.NOTES
    Author:  Yilmaz Mustafa a.k.a. Ch€f
    Website: http://github.com/yilmazchef/powershell-notebooks/Codes/calculator_doc.md
    Twitter: @_yilmaz_mustafa
#>
function Get-Div([Int]$number1, [Int]$number2){
    return ($number1 / $number2)
}


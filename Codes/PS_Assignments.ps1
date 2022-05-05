# CREATE 2 VARIABLES NAMED 'x' and 'y', GIVE THEM VALUES '10', '20'
$x = 10
$y = 20

# CREATE A FUNCTION WHICH GETS/RETURNS THE SQUARE OF X
function Get-Square($number) {
    return [math]::Pow(2, $number)
}

Get-Square $x

# CREATE A FUNCTION WHICH GETS/RETURNS THE SQUARE ROOT OF Y
function Get-Square-Root($number) {
    return [math]::Sqrt($number)
}

Get-Square-Root $y
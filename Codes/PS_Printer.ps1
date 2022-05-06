function Printer {
    param (
        $FirstName,
        $LastName,
        $Age,
        $Salary,
        $Twitter
    )

    Write-Host $FirstName $LastName
    Write-Host $Age
    Write-Host $Salary
    Write-Host $Twitter
}
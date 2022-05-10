function New-Penv() {

    Param(
        [Parameter(Mandatory = $False)]
        [String]
        $Key,
        [Parameter(Mandatory = $False)]
        [String]
        $Value
    )

    # validate mechanisme
    if ($Key -eq "") {
        $Key = Read-Host "Enter key"
    }

    if ($Value -eq "") {
        $Value = Read-Host "Enter value"
    }

    setx $Key $Value

}

Export-ModuleMember -Function -Name New-Penv



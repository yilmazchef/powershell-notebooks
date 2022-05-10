function Create-Env(){

    Param(
        $Key,
        $Value
    )

    Process {
        # validate mechanisme
        if($Key -eq ""){
            Write-Error "Key is missing."
            $Key = Read-Host "Enter key"
        }

        if($Value -eq ""){
            Write-Error "Value is missing."
            $Value = Read-Host "Enter value"
        }

        setx $Key $Value

    }


}

Export-ModuleMember -Function -Name Create-Env



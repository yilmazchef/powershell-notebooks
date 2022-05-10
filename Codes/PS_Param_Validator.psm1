function Test-Param () {

    Param(
        $param
    )

    return -not $param -eq "" -and -not $null -eq $param
}

Export-ModuleMember -Function -Name Test-Param
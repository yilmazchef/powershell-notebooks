

# PowerShell -WhatIf safety parameter
Get-Childitem "C:\PS-Test\" -Recurse | Remove-Item -WhatIf

# PowerShell -Confirm parameter
Get-Childitem "C:\PS-Test\" -Recurse | Remove-Item -Confirm

Remove-Item "C:\PS-Test\New folder" -Confirm:$false

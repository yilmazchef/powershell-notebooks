

# Using PowerShell commnads to create a new file
$Location = "C:\PS_Output"
New-Item -Path $Location -Name "FirstCreateFile.txt" -ItemType File -Force


# Here I define the folders and the extensions to look at.
$folder1 = ls "C:\PS_Output\Directory1\" -recurse -include "*.csv"
$destinationfolder = "C:\PS_Output\Directory2\"
Copy-Item -Path $folder1 -Destination $destinationfolder

#Read and Rename File
Get-Content "C:\PS_Output\git.txt"
Rename-Item "C:\PS_Output\git.txt" git-commands.txt

$Dir = get-childitem C:\windows\system32 
$List = $Dir | where { $_.extension -eq ".dll" }
$List

Move-Item $folder1  "C:\PS_Output\New folder"

Remove-Item "C:\PS_Output\Directory2" -Recurse -Force
# Import active directory module for running AD cmdlets
Import-Module ActiveDirectory
  
function New-ADUserX() {
    Param(
        [Parameter(
            Mandatory = $true, 
            ValueFromPipeline = $true,
            HelpMessage = "First name is required."
        )]
        [ValidateNotNullOrEmpty()]
        [Alias("FN", "FName")]
        $FirstName,        
        [Parameter(
            Mandatory = $true, 
            ValueFromPipeline = $true,
            HelpMessage = "Last name is required."
        )]
        [ValidateNotNullOrEmpty()]
        [Alias("LN", "LName")]
        $LastName,
        [Parameter(
            Mandatory = $true, 
            ValueFromPipeline = $true,
            HelpMessage = "Password is required."
        )]
        [ValidateNotNullOrEmpty()]
        [Alias("PWD", "Pass")]
        [SecureString]
        $Password
    )

    $UserName = "$($FirstName.ToLower()).$($LastName.ToLower())"
    $Username = $UserName.Replace(" ", "")

    try {
        
        #create new AD user
        New-ADUser -Name "$FirstName $LastName" `
            -GivenName "$FirstName" `
            -Surname "$LastName" `
            -EmailAddress ("{0}@{1}" -f $UserName, "intecbrussel.be") `
            -UserPrincipalName ("{0}@{1}" -f $UserName, "intecbrussel.be") `
            -SamAccountName $UserName `
            -Initials "$($FirstName[0])$($LastName[0])" `
            -DisplayName "$FirstName $LastName" `
            -AccountPassword $Password `
            -PasswordNeverExpires $true `
            -ChangePasswordAtLogon $False `
            -Enabled $true 

        Write-Host ("A new user is created with username: {0} and email {0}@{1}" -f $UserName, "intecbrussel.be")
    }
    catch {
        Write-Warning "Please try to enter valid input."   
    }

}

function Import-ADUsersX {
    Param(
        [Parameter(
            Mandatory = $true, 
            ValueFromPipeline = $true,
            HelpMessage = "Filename is required."
        )]
        [ValidateNotNullOrEmpty()]
        [Alias("F", "File")]
        $FilePath
    )
    
    $DefaultPassword = (Read-Host -AsSecureString "Default password for all users")

    #Store the data from ADUsers.csv in the $ADUsers variable
    $ADUsers = Import-csv $FilePath

    #Loop through each row containing user details in the CSV file 
    foreach ($User in $ADUsers) {

        $UserObj = $(try {Get-ADUser $User.$Username} catch {$null})

        #Read user data from each field in each row and assign the data to a variable as below
        #Check to see if the user already exists in AD
        if ($null -ne $UserObj) {
            #If user does exist, give a warning
            Write-Warning "A user account with username $User.$Username already exist in Active Directory."
        }
        else {
            #User does not exist then proceed to create the new user account
            #Account will be created in the OU provided by the $OU variable read from the CSV file
            New-ADUserX -FirstName $User.FirstName -LastName $User.LastName -Password $DefaultPassword
            
            #If user is created, show message.
            Write-Host "The user account $User.$Username is created." -ForegroundColor Cyan
        }

    }

}

Import-ADUsersX -FilePath ".\ADUsers.csv"
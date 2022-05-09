#In this example you create a VM named VeryFirstLinuxVM, in East US, using the Standard_B2s VM size.
New-AzVM `
    -ResourceGroupName "TutorialsGroup" `
    -Name "VeryFirstLinuxVM" `
    -Location "East US" `
    -Image UbuntuLTS `
    -Size Standard_B2s `
    -PublicIPAddressName FirstPublicIP `
    -OpenPorts 80,22 `
    -GenerateSshKey `
    -SshKeyName FirstSshKey

# The output must give you the location of the local copy of the SSH key. For example:
# Private key is saved to /home/user/.ssh/123456
# Public key is saved to /home/user/.ssh/123456.pub
# IMPORTANT: Make note of the path to your private key to use later.

# IF YOU RUN THE CODE LOCALLY WITHOUT CONNECTING TO AZURE CLOUD SHELL IT WILL NOT BE RECOGNIZED.
# THEREFORE, MAKE SURE THAT YOU RUN THE COMMAND ON AZSHELL, 
# HOWEVER, CAN WE MAKE SURE THE CODE IS CORRECTLY WRITTEN BEFORE WE TEST IT.
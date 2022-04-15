-   10 minutes

In this unit, you'll continue with the example of a company that makes Linux admin tools. Recall that you plan to use Linux VMs to let potential customers test your software. You have a resource group ready, and now it's time to create the VMs.

Your company has paid for a booth at a large Linux trade show. You plan a demo area containing three terminals each connected to a separate Linux VM. At the end of each day, you want to delete the VMs and recreate them, so they start fresh every morning. Creating the VMs manually after work when you're tired would be error prone. You want to write a PowerShell script to automate the VM creation process.

## Write a script to create virtual machines

Follow these steps in Cloud Shell on the right to write the script:

1.  Switch to your home folder in Cloud Shell.
    
    ```
    cd $HOME\clouddrive
    ```
    
2.  Create a new text file, named **ConferenceDailyReset.ps1**.
    
    ```
    touch "./ConferenceDailyReset.ps1"
    ```
    
3.  Open the integrated editor, and select the **ConferenceDailyReset.ps1** file.
    
    ```
    code "./ConferenceDailyReset.ps1"
    ```
    
    Tip
    
    The integrated Cloud Shell also supports vim, nano, and emacs if you'd prefer to use one of those editors.
    
4.  Start by capturing the input parameter in a variable. Add the following line to your script.
    
    ```
    param([string]$resourceGroup)
    ```
    
    Note
    
    Normally, you'd have to authenticate with Azure using your credentials using `Connect-AzAccount`, and you could do so in the script. However, in Cloud Shell environment you will already be authenticated, so this is unnecessary.
    
5.  Prompt for a username and password for the VM's admin account and capture the result in a variable:
    
    ```
    $adminCredential = Get-Credential -Message "Enter a username and password for the VM administrator."
    ```
    
6.  Create a loop that executes three times:
    
    ```
    For ($i = 1; $i -le 3; $i++) 
    {
    
    }
    ```
    
7.  In the loop body, create a name for each VM and store it in a variable, and output it to the console:
    
    ```
    $vmName = "ConferenceDemo" + $i
    Write-Host "Creating VM: " $vmName
    ```
    
8.  Next, create a VM using the `$vmName` variable:
    
    ```
    New-AzVm -ResourceGroupName $resourceGroup -Name $vmName -Credential $adminCredential -Image UbuntuLTS
    ```
    
9.  Save the file. You can use the "..." menu at the top right corner of the editor. There are also common accelerator keys for _Save_, like Ctrl-S.
    

The completed script should look like the following code:

```
param([string]$resourceGroup)

$adminCredential = Get-Credential -Message "Enter a username and password for the VM administrator."

For ($i = 1; $i -le 3; $i++)
{
    $vmName = "ConferenceDemo" + $i
    Write-Host "Creating VM: " $vmName
    New-AzVm -ResourceGroupName $resourceGroup -Name $vmName -Credential $adminCredential -Image UbuntuLTS
}
```

## Run the script

1.  Save the file, and close the editor using the "..." context menu on the top right of the editor.
    
2.  Run the script.
    
    ```
    ./ConferenceDailyReset.ps1 [sandbox resource group name]
    ```
    
    The script will take several minutes to complete. When it's finished, verify it ran successfully by looking at the resources you now have in your resource group:
    
    ```
    Get-AzResource -ResourceType Microsoft.Compute/virtualMachines
    ```
    

You should see three VMs, each with a unique name.

You wrote a script that automated the creation of three VMs in the resource group indicated by a script parameter. The script is short and simple, but automates a process that would take a long time to complete manually with the Azure portal.

Need help? See our [troubleshooting guide][1] or provide specific feedback by [reporting an issue][2].

[1]: https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.automate-azure-tasks-with-powershell.8-exercise-create-resource-using-script&documentId=7c56a65b-f5af-563d-bcc8-3890cd58a14d&versionIndependentDocumentId=aeb4ae4f-b4ef-a767-6052-908a24d3b773&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fautomate-azure-tasks-with-powershell%2F8-exercise-create-resource-using-script.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fautomate-azure-tasks-with-powershell%2F8-exercise-create-resource-using-script&author=mirobb
[2]: https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.automate-azure-tasks-with-powershell.8-exercise-create-resource-using-script&documentId=7c56a65b-f5af-563d-bcc8-3890cd58a14d&versionIndependentDocumentId=aeb4ae4f-b4ef-a767-6052-908a24d3b773&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fautomate-azure-tasks-with-powershell%2F8-exercise-create-resource-using-script.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fautomate-azure-tasks-with-powershell%2F8-exercise-create-resource-using-script&author=mirobb#report-feedback
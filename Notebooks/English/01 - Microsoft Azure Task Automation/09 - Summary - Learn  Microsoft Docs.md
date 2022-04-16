-   3 minutes

In this module, we wrote a script to automate the creation of multiple
VMs. Even though the script was relatively short, you can see the
potential power when you combine loops, variables, and functions from
PowerShell with cmdlets from Azure PowerShell.

Azure PowerShell is a good automation choice for admins with PowerShell
experience. The combination of clean syntax and a powerful scripting
language also makes it worth considering even if you are new to
PowerShell. This level of automation for time-consuming and error-prone
tasks should help you reduce administrative time and increase quality.

## Clean up

The sandbox automatically cleans up your resources when you're finished
with this module.

When you're working in your own subscription, it's a good idea at the
end of a project to identify whether you still need the resources you
created. Resources left running can cost you money. You can delete
resources individually or delete the resource group to delete the entire
set of resources.

When you are running in your own subscription, you can use the following
PowerShell cmdlet to delete the resource group (and all related
resources).

``` powershell
Remove-AzResourceGroup -Name MyResourceGroupName
```

When you are asked to confirm the delete, answer **Yes**, or you can add
the `-Force` parameter to skip the prompt. The command may take several
minutes to complete.

## Check your knowledge

Need help? See our [troubleshooting
guide](https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.automate-azure-tasks-with-powershell.9-summary&documentId=7f51e594-0ff9-9f02-9d0e-1005bd6ceca7&versionIndependentDocumentId=2625c5d3-62fc-cede-764c-afc05c6f5d2e&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fautomate-azure-tasks-with-powershell%2F9-summary.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fautomate-azure-tasks-with-powershell%2F9-summary&author=mirobb)
or provide specific feedback by [reporting an
issue](https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.automate-azure-tasks-with-powershell.9-summary&documentId=7f51e594-0ff9-9f02-9d0e-1005bd6ceca7&versionIndependentDocumentId=2625c5d3-62fc-cede-764c-afc05c6f5d2e&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fautomate-azure-tasks-with-powershell%2F9-summary.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fautomate-azure-tasks-with-powershell%2F9-summary&author=mirobb#report-feedback).

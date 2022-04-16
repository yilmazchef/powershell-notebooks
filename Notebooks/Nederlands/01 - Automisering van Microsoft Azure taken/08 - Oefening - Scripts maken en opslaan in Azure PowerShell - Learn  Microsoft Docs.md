## Oefening: scripts maken en opslaan in Azure PowerShell

-   10 minuten

In dit onderdeel gaat u verder met het voorbeeld van een bedrijf dat
Linux-beheertools maakt. Bedenk dat u van plan bent Linux-VM's te
gebruiken om potentiële klanten uw software te laten testen. U hebt een
resourcegroep gereed en nu is het tijd om de VM's te maken.

Uw bedrijf heeft betaald voor een stand op een grote Linux-beurs. U
plant een demoruimte met drie terminals die elk zijn verbonden met een
afzonderlijke Linux-VM. Aan het einde van elke dag wilt u de VM's
verwijderen en opnieuw maken, zodat ze elke ochtend opnieuw beginnen.
Het handmatig maken van de VM's na het werk wanneer u moe bent, zou
foutgevoelig zijn. U wilt een PowerShell-script schrijven om het proces
voor het maken van VM's te automatiseren.

## Een script schrijven om virtuele machines te maken

Volg deze stappen in Cloud Shell aan de rechterkant om het script te
schrijven:

1.  Schakel over naar uw thuismap in Cloud Shell.

    ``` powershell
    cd $HOME\clouddrive
    ```

2.  Maak een nieuw tekstbestand met de naam
    **ConferenceDailyReset.ps1**.

    ``` powershell
    touch "./ConferenceDailyReset.ps1"
    ```

3.  Open de geïntegreerde editor en selecteer het bestand
    **ConferenceDailyReset.ps1**.

    ``` powershell
    code "./ConferenceDailyReset.ps1"
    ```

    Fooi

    De geïntegreerde Cloud Shell ondersteunt ook vim, nano en emacs als
    u liever een van die editors gebruikt.

4.  Begin met het vastleggen van de invoerparameter in een variabele.
    Voeg de volgende regel toe aan uw script.

    ``` powershell
    param([string]$resourceGroup)
    ```

    Notitie

    Normaal gesproken zou u zich moeten verifiëren met Azure met behulp
    van uw referenties met behulp van , en u kunt dit doen in het
    script. In Cloud Shell-omgeving wordt u echter al geauthenticeerd,
    dus dit is niet nodig.`Connect-AzAccount`

5.  Vraag om een gebruikersnaam en wachtwoord voor het beheerdersaccount
    van de VM en leg het resultaat vast in een variabele:

    ``` powershell
    $adminCredential = Get-Credential -Message "Enter a username and password for the VM administrator."
    ```

6.  Maak een lus die drie keer wordt uitgevoerd:

    ``` powershell
    For ($i = 1; $i -le 3; $i++) 
    {

    }
    ```

7.  Maak in de lustekst een naam voor elke VM en sla deze op in een
    variabele en voer deze uit naar de console:

    ``` powershell
    $vmName = "ConferenceDemo" + $i
    Write-Host "Creating VM: " $vmName
    ```

8.  Next, create a VM using the variable:`$vmName`

    ``` powershell
    New-AzVm -ResourceGroupName $resourceGroup -Name $vmName -Credential $adminCredential -Image UbuntuLTS
    ```

9.  Save the file. You can use the "..." menu at the top right corner of
    the editor. There are also common accelerator keys for *Save*, like
    .Ctrl-S

The completed script should look like the following code:

``` powershell
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

1.  Save the file, and close the editor using the "..." context menu on
    the top right of the editor.

2.  Run the script.

    ``` powershell
    ./ConferenceDailyReset.ps1 [sandbox resource group name]
    ```

    The script will take several minutes to complete. When it's
    finished, verify it ran successfully by looking at the resources you
    now have in your resource group:

    ``` powershell
    Get-AzResource -ResourceType Microsoft.Compute/virtualMachines
    ```

You should see three VMs, each with a unique name.

You wrote a script that automated the creation of three VMs in the
resource group indicated by a script parameter. The script is short and
simple, but automates a process that would take a long time to complete
manually with the Azure portal.

Need help? See our [troubleshooting
guide](https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.automate-azure-tasks-with-powershell.8-exercise-create-resource-using-script&documentId=7c56a65b-f5af-563d-bcc8-3890cd58a14d&versionIndependentDocumentId=aeb4ae4f-b4ef-a767-6052-908a24d3b773&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fautomate-azure-tasks-with-powershell%2F8-exercise-create-resource-using-script.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fautomate-azure-tasks-with-powershell%2F8-exercise-create-resource-using-script&author=mirobb)
or provide specific feedback by [reporting an
issue](https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.automate-azure-tasks-with-powershell.8-exercise-create-resource-using-script&documentId=7c56a65b-f5af-563d-bcc8-3890cd58a14d&versionIndependentDocumentId=aeb4ae4f-b4ef-a767-6052-908a24d3b773&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fautomate-azure-tasks-with-powershell%2F8-exercise-create-resource-using-script.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fautomate-azure-tasks-with-powershell%2F8-exercise-create-resource-using-script&author=mirobb#report-feedback).

## Oefening: een Azure-resource maken met scripts in Azure PowerShell

- 15 minuten

Denk aan ons oorspronkelijke scenario: VM's maken om onze CRM-software te testen. Wanneer een nieuwe build beschikbaar is, willen we een nieuwe VM opstarten, zodat we de volledige installatie-ervaring van een schone installatiekopie kunnen testen. Wanneer we klaar zijn, willen we de VM verwijderen.

Laten we de opdrachten proberen die u zou gebruiken om een VM te maken.

## Een Linux-VM maken met Azure PowerShell

Omdat we de Azure-sandbox gebruiken, hoeft u geen resource-groep te maken. Gebruik in plaats daarvan de resource-groep **\[naam sandbox-resourcegroep\]**. Houd daarnaast rekening met de locatiebeperkingen.

Laten we een nieuwe Azure VM maken met PowerShell.

1. Gebruik de cmdlet om een VM te maken.`New-AzVm`

    - Gebruik de resource-groep **\[naam sandbox-resourcegroep\]**.

    - Geef de VM een naam. Meestal wilt u iets zinvols gebruiken dat de doeleinden van de VM, locatie en (als er meer dan één) instantienummer identificeert. We gebruiken "testvm-eus-01" voor "Test VM in US - oost, instantie 1". Bedenk uw eigen naam op basis van waar u de VM plaatst.

    - Selecteer een locatie bij u in de buurt in de volgende lijst, beschikbaar in de Azure-sandbox. Zorg ervoor dat u de waarde in de volgende voorbeeldopdracht wijzigt als u kopiëren en plakken gebruikt.

        - westus2
        - southcentralus
        - centralus
        - eastus
        - westeurope
        - zuidoosten
        - japaneast
        - brazilsouth
        - australiasoutheast
        - centralindia
  
    - Gebruik "UbuntuLTS" voor de afbeelding; dit is Ubuntu Linux.

    - Gebruik de cmdlet en voer de resultaten in de parameter in.`Get-Credential``Credential`

        Belangrijk

        Zie de [Veelgestelde vragen over Linux VM][1] voor beperkingen van gebruikersnaam en wachtwoord. Wachtwoorden moeten 12 - 123 tekens lang zijn en voldoen aan drie van de volgende vier complexiteitsvereisten:

        > - Kleine letters hebben
        > - Hoofdletters hebben
        > - Een cijfer hebben
        > - Een speciaal teken hebben (Regex-overeenkomst \[\\W\_\])

    - Voeg de parameter toe en geef "22" door als de poort. Deze poort laat ons SSH in de machine.`-OpenPorts`

    - Maak een openbare IP-adresnaam. U gebruikt deze naam om uw statische IP-adres te maken en te vinden om u aan te melden bij het apparaat.

    ```powershell
    New-AzVm -ResourceGroupName [sandbox resource group name] -Name "testvm-eus-01" -Credential (Get-Credential) -Location "East US" -Image UbuntuLTS -OpenPorts 22 -PublicIpAddressName "testvm-01"
    ```

    Fooi

    U kunt de knop **Kopiëren** gebruiken om opdrachten naar het klembord te kopiëren. Als u wilt plakken, klikt u met de rechtermuisknop op een nieuwe regel in het Cloud Shell-venster en selecteert u **Plakken** of gebruikt u de sneltoets (op macOS).Shift+Insert⌘+V

2. Create a username and password, then press . PowerShell will start creating your VM.`Enter`

3. The VM creation takes a few minutes to complete. After completion, you can query it and assign the VM object to a variable ().`$vm`

    ```powershell
    $vm = (Get-AzVM -Name "testvm-eus-01" -ResourceGroupName [sandbox resource group name])
    ```

4. Query the value to dump out the information about the VM.

    ```powershell
    $vm
    ```

    You should see something like the following output:

    ```console
    ResourceGroupName : [sandbox resource group name]
    Id                : /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/[sandbox resource group name]/providers/Microsoft.Compute/virtualMachines/testvm-eus-01
    VmId              : 00000000-0000-0000-0000-000000000000
    Name              : testvm-eus-01
    Type              : Microsoft.Compute/virtualMachines
    Location          : eastus
    Tags              : {}
    HardwareProfile   : {VmSize}
    NetworkProfile    : {NetworkInterfaces}
    OSProfile         : {ComputerName, AdminUsername, LinuxConfiguration, Secrets}
    ProvisioningState : Succeeded
    StorageProfile    : {ImageReference, OsDisk, DataDisks}
    ```

5. You can reach into complex objects through a dot (".") notation. For example, to see the properties in the object associated with the HardwareProfile section, run the following command:`VMSize`

    ```powershell
    $vm.HardwareProfile
    ```

6. Or, to get information on one of the disks, run the following command:

    ```powershell
    $vm.StorageProfile.OsDisk
    ```

7. You can even pass the VM object into other cmdlets. For example, running the following command will show you all available sizes for your VM:

    ```powershell
    $vm | Get-AzVMSize
    ```

8. Now, run the following command to get your public IP address:

    ```powershell
    Get-AzPublicIpAddress -ResourceGroupName [sandbox resource group name] -Name "testvm-01"
    ```

9. With the IP address, you can connect to the VM with SSH. For example, if you used the username "bob", and the IP address is "205.22.16.5", running this command would connect to the Linux machine:

    ```powershell
    ssh bob@205.22.16.5
    ```

    Log out by entering .`exit`

## Delete a VM

To try out some more commands, let's delete the VM. We'll shut it down first:

```powershell
Stop-AzVM -Name $vm.Name -ResourceGroupName $vm.ResourceGroupName
```

Now, let's delete the VM by running the cmdlet:`Remove-AzVM`

```powershell
Remove-AzVM -Name $vm.Name -ResourceGroupName $vm.ResourceGroupName
```

Run this command to list all the resources in your resource group:

```powershell
Get-AzResource -ResourceGroupName $vm.ResourceGroupName | Format-Table
```

You should see a bunch of resources (disks, virtual networks, and so on) that all still exist.

```powershell
Microsoft.Compute/disks
Microsoft.Network/networkInterfaces
Microsoft.Network/networkSecurityGroups
Microsoft.Network/publicIPAddresses
Microsoft.Network/virtualNetworks
```

The command _just deletes the VM_. It doesn't clean up any of the other resources. At this point, we'd likely just delete the resource group itself and be done with it. However, let's run through the exercise to clean it up manually. You should see a pattern in the commands.`Remove-AzVM`

1. Delete the network interface:

    ```powershell
    $vm | Remove-AzNetworkInterface –Force
    ```

2. Delete the managed OS disks and storage account:

    ```powershell
    Get-AzDisk -ResourceGroupName $vm.ResourceGroupName -DiskName $vm.StorageProfile.OSDisk.Name | Remove-AzDisk -Force
    ```

3. Next, delete the virtual network:

    ```powershell
    Get-AzVirtualNetwork -ResourceGroupName $vm.ResourceGroupName | Remove-AzVirtualNetwork -Force
    ```

4. Delete the network security group:

    ```powershell
    Get-AzNetworkSecurityGroup -ResourceGroupName $vm.ResourceGroupName | Remove-AzNetworkSecurityGroup -Force
    ```

5. And finally, delete the public IP address:

    ```powershell
    Get-AzPublicIpAddress -ResourceGroupName $vm.ResourceGroupName | Remove-AzPublicIpAddress -Force
    ```

We should've caught all the created resources. Check the resource group just to be sure. We performed many manual commands here, but a better approach would have been to write a _script_. Then we could reuse this logic later to create or delete a VM. Let's look at scripting with PowerShell.

___

## Next unit: Create and save scripts in Azure PowerShell

[Continue][2]

Need help? See our [troubleshooting guide][3] or provide specific feedback by [reporting an issue][4].

[1]: https://docs.microsoft.com/en-us/azure/virtual-machines/linux/faq#what-are-the-username-requirements-when-creating-a-vm
[2]: https://docs.microsoft.com/en-us/learn/modules/automate-azure-tasks-with-powershell/7-create-resource-using-script/
[3]: https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.automate-azure-tasks-with-powershell.6-exercise-create-resource-interactively&documentId=77ba3b53-ba0c-d53e-d5df-24d1b9bef7b0&versionIndependentDocumentId=f12a42d4-7b4b-99c1-df77-181b7533bf12&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fautomate-azure-tasks-with-powershell%2F6-exercise-create-resource-interactively.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fautomate-azure-tasks-with-powershell%2F6-exercise-create-resource-interactively&author=mirobb
[4]: https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.automate-azure-tasks-with-powershell.6-exercise-create-resource-interactively&documentId=77ba3b53-ba0c-d53e-d5df-24d1b9bef7b0&versionIndependentDocumentId=f12a42d4-7b4b-99c1-df77-181b7533bf12&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fautomate-azure-tasks-with-powershell%2F6-exercise-create-resource-interactively.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fautomate-azure-tasks-with-powershell%2F6-exercise-create-resource-interactively&author=mirobb#report-feedback

## Bepaal of Azure PowerShell geschikt is voor uw taken

- 5 minuten

Stel dat u een hulpprogramma moet kiezen voor het beheer van de Azure-resources die u gebruikt om uw CRM-systeem (Customer Relationship Management) te testen. Voor uw tests moet u resourcegroepen maken en virtuele machines (VM's) inrichten.

U wilt iets dat gemakkelijk te leren is voor beheerders, maar krachtig genoeg om de installatie en configuratie van meerdere virtuele machines te automatiseren of een volledige toepassingsomgeving te scripten. Er zijn meerdere tools beschikbaar en u moet de beste vinden voor uw mensen en taken.

Azure biedt drie beheerhulpprogramma's:

- Azure Portal
- De Azure CLI
- Azure PowerShell

Ze bieden allemaal ongeveer evenveel controle; elke taak die u met een van de tools kunt uitvoeren, kunt u waarschijnlijk met de andere twee doen. Alle drie zijn platformonafhankelijk en draaien ze op Windows, macOS en Linux. Ze verschillen in syntaxis, installatievereisten, automatiseringsondersteuning.

Hier zullen we elk van de drie opties beschrijven en enkele richtlijnen geven over hoe u tussen hen kunt beslissen.

## Wat is Azure Portal?

Azure Portal is een website waarmee u de resources in uw Azure-abonnement kunt maken, configureren en wijzigen. De portal is een grafische gebruikersinterface (GUI) die het gemakkelijk maakt om de bron te vinden die u nodig hebt en eventuele vereiste wijzigingen uit te voeren. Het leidt u ook door complexe beheertaken door wizards en knopinfo te bieden.

De portal biedt geen enkele manier om repetitieve taken te automatiseren. Als u bijvoorbeeld 15 VM's wilt instellen, moet u deze één voor één maken en de wizard voor elke VM voltooien. Dit kan tijdrovend zijn en is foutgevoelig voor complexe taken.

## Wat is de Azure CLI?

De Azure CLI is een platformonafhankelijk opdrachtregelprogramma om verbinding te maken met Azure en beheeropdrachten uit te voeren op Azure-resources. Als u bijvoorbeeld een VM wilt maken, gebruikt u een opdracht als de volgende:

```
az vm create \
  --resource-group CrmTestingResourceGroup \
  --name CrmUnitTests \
  --image UbuntuLTS
  ...
```

De Azure CLI is op twee manieren beschikbaar: in een browser via de Azure Cloud Shell of met een lokale installatie op Linux, Mac of Windows. In beide gevallen kunt u het interactief gebruiken of gebruiken met scripts om taken te automatiseren. Voor interactief gebruik start u eerst een shell zoals op Windows of Bash op Linux of macOS en geeft u vervolgens de opdrachten uit bij de shellprompt. Als u repetitieve taken wilt automatiseren, voegt u de opdrachten samen in een shellscript met behulp van de scriptsyntaxis van de door u gekozen shell en voert u het script vervolgens uit.`cmd.exe`

Azure PowerShell is een module die u toevoegt aan PowerShell om u in staat te stellen verbinding te maken met uw Azure-abonnement en resources te beheren. Azure PowerShell vereist powershell om te functioneren. PowerShell biedt services zoals het shellvenster, opdrachtparsering, enzovoort. De Azure Az PowerShell-module voegt Azure-specifieke opdrachten toe.

Azure PowerShell biedt bijvoorbeeld de opdracht **New-AzVM**, waarmee een virtuele machine voor u wordt gemaakt in uw Azure-abonnement. Om het te gebruiken, start u de PowerShell-toepassing en geeft u vervolgens een opdracht als de volgende:

```
New-AzVm `
    -ResourceGroupName "CrmTestingResourceGroup" `
    -Name "CrmUnitTests" `
    -Image "UbuntuLTS"
    ...
```

Azure PowerShell is ook op twee manieren beschikbaar: in een browser via de Azure Cloud Shell of met een lokale installatie op Linux, Mac of Windows. In beide gevallen heb je twee modi om uit te kiezen. U kunt het gebruiken in de interactieve modus, waarin u handmatig één opdracht tegelijk uitvoert, of in de scriptmodus, waarbij u een script uitvoert dat uit meerdere opdrachten bestaat.

Er is een geschatte pariteit tussen de portal, de Azure CLI en Azure PowerShell met betrekking tot de Azure-objecten die ze kunnen beheren en de configuraties die ze kunnen maken. Ze zijn ook allemaal platformonafhankelijk. Dit betekent dat u meestal rekening houdt met verschillende andere factoren bij het maken van uw keuze:

- **Automatisering**: Moet u een reeks complexe of repetitieve taken automatiseren? Azure PowerShell en de Azure CLI ondersteunen dit, terwijl Azure Portal dit niet ondersteunt.

- **Leercurve**: Moet u een taak snel voltooien zonder nieuwe opdrachten of syntaxis te leren? Azure Portal vereist niet dat u syntaxis leert of opdrachten onthoudt. In Azure PowerShell en de Azure CLI moet u de gedetailleerde syntaxis kennen voor elke opdracht die u gebruikt.

- **Team skillset**: Heeft uw team bestaande expertise? Uw team heeft bijvoorbeeld PowerShell gebruikt om Windows te beheren. Als dat het geval is, zullen ze snel vertrouwd raken met het gebruik van Azure PowerShell.

## Example

Recall that you are choosing an administrative tool to create the test environments for your CRM application. Your administrators have two specific Azure tasks they need to complete:

1. Create one resource group for each category of testing (unit, integration, and acceptance)
2. Create multiple VMs in each resource group before every round of testing

To create the resource groups, the Azure portal is a reasonable choice. These are one-off tasks, so you don't need scripts to complete them.

Finding the best tool to create the VMs is a more challenging decision. You need to create several VMs, and you need to create them repeatedly, likely several times each week. This means you'll want automation, so the Azure portal is not a good choice. In this case, either Azure PowerShell or the Azure CLI will meet your needs. If your team members have some existing PowerShell knowledge, Azure PowerShell will likely be the best match. Azure PowerShell is available on the operating systems your admin team uses, it supports automation, and should be quick for your team to learn.

Most administrators' first experience with Azure is in the Portal. It's a great place to start as it provides a clean, well-structured graphical interface, but provides limited options for automation. When you need automation, Azure gives you two options: Azure PowerShell for admins with PowerShell experience and the Azure CLI for everyone else.

In practice, businesses typically have a mix of one-off and repetitive tasks. This means it is common to use both the Portal and a scripting solution. In our CRM example, it's appropriate to create the resource groups via the Portal and automate the VM creation with PowerShell.

The rest of this module focuses on installing and using Azure PowerShell.

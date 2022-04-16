## Werken met de Azure CLI

- 5 minuten

Met de Azure CLI kunt u opdrachten typen en deze onmiddellijk vanaf de opdrachtregel uitvoeren. Bedenk dat het algemene doel in het voorbeeld van softwareontwikkeling is om nieuwe builds van een web-app te implementeren voor testen. Laten we het hebben over de soorten taken die u kunt uitvoeren met de Azure CLI.

## Welke Azure-resources kunnen worden beheerd met de Azure CLI?

Met de Azure CLI kunt u bijna elk aspect van elke Azure-resource beheren. U kunt werken met resourcegroepen, opslag, virtuele machines, Azure Active Directory (Azure AD), containers, machine learning, enzovoort.

Opdrachten in de CLI zijn gestructureerd in _groepen_ en _subgroepen_. Elke groep vertegenwoordigt een service die wordt geleverd door Azure en de subgroepen verdelen opdrachten voor deze services in logische groeperingen. De groep bevat bijvoorbeeld subgroepen, waaronder **account**, **blob** en **wachtrij**.`storage`

Dus, hoe vind je de specifieke commando's die je nodig hebt? Een manier is om de AI-robot te gebruiken die de Azure-documentatie gebruikt om u meer te vertellen over opdrachten, de CLI en meer.`az find`

Voorbeeld - zoek de meest populaire opdrachten met betrekking tot het woord **blob**.

```
az find blob
```

Voorbeeld: toon de populairste opdrachten voor een Azure CLI-opdrachtgroep, zoals .`az vm`

```
az find "az vm"
```

Voorbeeld: toon de populairste parameters en subopdrachten voor een Azure CLI-opdracht.

```
az find "az vm create"
```

Als u de naam van de gewenste opdracht al weet, krijgt u met het argument voor die opdracht meer gedetailleerde informatie over de opdracht en voor een opdrachtgroep een lijst met de beschikbare subopdrachten. Dus, met ons opslagvoorbeeld, kunt u als volgt een lijst krijgen met de subgroepen en opdrachten voor het beheren van blobopslag:`--help`

```
az storage blob --help
```

## Een Azure-resource maken

Wanneer u een nieuwe Azure-resource maakt, zijn er meestal drie stappen: verbinding maken met uw Azure-abonnement, de resource maken en controleren of het maken is gelukt. In de volgende afbeelding ziet u een overzicht van het proces op hoog niveau.

![An illustration showing the steps to create an Azure resource using the command-line interface.](Work%20with%20the%20Azure%20CLI%20-%20Learn%20%20Microsoft%20Docs/media4-create-resources-overview.png)

Elke stap komt overeen met een andere Azure CLI-opdracht.

### Verbinden

Aangezien u werkt met een lokale installatie van de Azure CLI, moet u zich verifiëren voordat u Azure-opdrachten kunt uitvoeren met behulp van de **Azure CLI-aanmeldingsopdracht**.

```
az login
```

De Azure CLI start meestal uw standaardbrowser om de Azure-aanmeldingspagina te openen. Als dit niet werkt, volgt u de instructies op de opdrachtregel en voert u een autorisatiecode in bij [https://aka.ms/devicelogin](https://aka.ms/devicelogin).

Na een geslaagde aanmelding wordt u verbonden met uw Azure-abonnement.

### Create

You'll often need to create a new resource group before you create a new Azure service, so we'll use resource groups as an example to show how to create Azure resources from the CLI.

The Azure CLI **group create** command creates a resource group. You must specify a name and location. The name must be unique within your subscription. The location determines where the metadata for your resource group will be stored. You use strings like "West US", "North Europe", or "West India" to specify the location; alternatively, you can use single word equivalents, such as westus, northeurope, or westindia. The core syntax is:

```
az group create --name <name> --location <location>
```

Important

You do not need to create a resource group when using the free Azure sandbox. Instead, you will use a pre-created resource group.

### Verify

For many Azure resources, the Azure CLI provides a **list** subcommand to view resource details. For example, the Azure CLI **group list** command lists your Azure resource groups. This is useful here to verify whether creation of the resource group was successful:

```
az group list
```

To get a more concise view, you can format the output as a simple table:

```
az group list --output table
```

___

## Next unit: Exercise - Create an Azure website using the CLI

[Continue](https://docs.microsoft.com/en-us/learn/modules/control-azure-services-with-cli/5-exercise-create-website-using-the-cli/)

Need help? See our [troubleshooting guide](https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.control-azure-services-with-cli.4-work-with-the-cli&documentId=48fd4bcd-d5b8-38e4-1e06-e122d1e91a57&versionIndependentDocumentId=5d11169e-5774-d236-2d82-08d547a3a5a7&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fcontrol-azure-services-with-cli%2F4-work-with-the-cli.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fcontrol-azure-services-with-cli%2F4-work-with-the-cli&author=dbradish) or provide specific feedback by [reporting an issue](https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.control-azure-services-with-cli.4-work-with-the-cli&documentId=48fd4bcd-d5b8-38e4-1e06-e122d1e91a57&versionIndependentDocumentId=5d11169e-5774-d236-2d82-08d547a3a5a7&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fcontrol-azure-services-with-cli%2F4-work-with-the-cli.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fcontrol-azure-services-with-cli%2F4-work-with-the-cli&author=dbradish#report-feedback).

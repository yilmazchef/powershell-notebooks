## Introductie

-   3 minuten

Het maken van beheerscripts is een krachtige manier om uw workflow te optimaliseren. U kunt veelvoorkomende, repetitieve taken automatiseren. Zodra een script is geverifieerd, wordt het consistent uitgevoerd, waardoor fouten waarschijnlijk worden verminderd.

Stel dat u werkt bij een bedrijf dat Azure Virtual Machines (VM's) gebruikt om uw CRM-software (Customer Relationship Management) te testen. De VM's zijn opgebouwd uit installatiekopieën met een webfront-end, een webservice die bedrijfslogica implementeert en een SQL-database.

U hebt meerdere testrondes uitgevoerd op één VM, maar u hebt gemerkt dat wijzigingen in de database en configuratiebestanden inconsistente resultaten kunnen veroorzaken. In één geval creëerde een bug een telefoongespreksrecord zonder overeenkomstige klant in de database. De verweesde record zorgde ervoor dat latere integratietests mislukten, zelfs nadat u de bug had opgelost. U bent van plan dit probleem op te lossen door voor elke testcyclus een nieuwe VM-implementatie te gebruiken. U wilt de installatie van het maken van VM's automatiseren omdat deze vele malen per week wordt uitgevoerd.

Hier leert u hoe u Azure-resources kunt beheren met Azure PowerShell. U gebruikt Azure PowerShell interactief voor eenmalige taken en schrijft scripts om herhaalde taken te automatiseren.

## Leerdoelen

In deze module ga je:

- Bepaal of Azure PowerShell het juiste hulpprogramma is voor uw Azure-beheertaken
- Azure PowerShell installeren op Linux, macOS en/of Windows
- Verbinding maken met een Azure-abonnement via Azure PowerShell
- Azure-resources maken met Azure PowerShell

## Voorwaarden

- Ervaring met een opdrachtregelinterface zoals PowerShell of Bash
- Kennis van basisconcepten van Azure, zoals resourcegroepen en virtuele machines
- Ervaring met het beheren van Azure-resources met behulp van Azure Portal

___

## Volgende eenheid: Beslissen of Azure PowerShell geschikt is voor uw taken

[Voortzetten][1]

Hulp nodig? Raadpleeg onze [handleiding voor probleemoplossing][2] of geef specifieke feedback door [een probleem te melden][3].

[1]: https://docs.microsoft.com/en-us/learn/modules/automate-azure-tasks-with-powershell/2-decide-if-azure-powershell-is-right-for-your-tasks/
[2]: https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.automate-azure-tasks-with-powershell.1-introduction&documentId=12b3f300-3d4d-9d19-1649-36d0e83ec3ec&versionIndependentDocumentId=309cc91c-1013-0472-e643-85327d85a13e&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fautomate-azure-tasks-with-powershell%2F1-introduction.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fautomate-azure-tasks-with-powershell%2F1-introduction&author=mirobb
[3]: https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.automate-azure-tasks-with-powershell.1-introduction&documentId=12b3f300-3d4d-9d19-1649-36d0e83ec3ec&versionIndependentDocumentId=309cc91c-1013-0472-e643-85327d85a13e&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fautomate-azure-tasks-with-powershell%2F1-introduction.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fautomate-azure-tasks-with-powershell%2F1-introduction&author=mirobb#report-feedback
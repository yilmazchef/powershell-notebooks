## Samenvatting

-   3 minuten

In deze module hebben we een script geschreven om het maken van meerdere VM's te automatiseren. Hoewel het script relatief kort was, kunt u de potentiële kracht zien wanneer u lussen, variabelen en functies van PowerShell combineert met cmdlets van Azure PowerShell.

Azure PowerShell is een goede automatiseringskeuze voor beheerders met PowerShell-ervaring. De combinatie van schone syntaxis en een krachtige scripttaal maakt het ook het overwegen waard, zelfs als u nieuw bent bij PowerShell. Dit automatiseringsniveau voor tijdrovende en foutgevoelige taken zou u moeten helpen de administratieve tijd te verkorten en de kwaliteit te verhogen.

## Opschonen

De sandbox ruimt uw resources automatisch op wanneer u klaar bent met deze module.

Wanneer u in uw eigen abonnement werkt, is het een goed idee om aan het einde van een project te bepalen of u de resources die u hebt gemaakt nog steeds nodig hebt. Middelen die blijven draaien, kunnen u geld kosten. U kunt bronnen afzonderlijk verwijderen of de brongroep verwijderen om de volledige set bronnen te verwijderen.

Wanneer u in uw eigen abonnement wordt uitgevoerd, kunt u de volgende PowerShell-cmdlet gebruiken om de resourcegroep (en alle gerelateerde bronnen) te verwijderen.

```
Remove-AzResourceGroup -Name MyResourceGroupName
```

Wanneer u wordt gevraagd het verwijderen te bevestigen, **antwoordt u Ja** of kunt u de parameter toevoegen om de prompt over te slaan. Het kan enkele minuten duren voordat de opdracht is voltooid.`-Force`

## Controleer uw kennis

Hulp nodig? Raadpleeg onze [handleiding voor probleemoplossing][1] of geef specifieke feedback door [een probleem te melden][2].

[1]: https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.automate-azure-tasks-with-powershell.9-summary&documentId=7f51e594-0ff9-9f02-9d0e-1005bd6ceca7&versionIndependentDocumentId=2625c5d3-62fc-cede-764c-afc05c6f5d2e&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fautomate-azure-tasks-with-powershell%2F9-summary.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fautomate-azure-tasks-with-powershell%2F9-summary&author=mirobb
[2]: https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.automate-azure-tasks-with-powershell.9-summary&documentId=7f51e594-0ff9-9f02-9d0e-1005bd6ceca7&versionIndependentDocumentId=2625c5d3-62fc-cede-764c-afc05c6f5d2e&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fautomate-azure-tasks-with-powershell%2F9-summary.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fautomate-azure-tasks-with-powershell%2F9-summary&author=mirobb#report-feedback
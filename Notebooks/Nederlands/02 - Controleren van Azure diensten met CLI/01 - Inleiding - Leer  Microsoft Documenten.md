## Introductie

- 3 minuten

Azure Portal is ideaal voor het uitvoeren van afzonderlijke taken en
voor een snel overzicht van de status van uw resources. Maar voor taken
die dagelijks of zelfs elk uur moeten worden herhaald, kan het gebruik
van de opdrachtregel en een reeks geteste opdrachten of scripts helpen
uw werk sneller gedaan te krijgen en fouten te voorkomen.

Stel dat u werkt bij een bedrijf dat Azure Web Apps ontwikkelt. Dit zijn
toepassingen die worden gehost in Azure, met alle voordelen van
automatisch geconfigureerde beveiliging, taakverdeling, beheer,
enzovoort. U test momenteel een web-app die verkoopprognoses genereert
op basis van een reeks invoer uit verschillende databases en andere
gegevensbronnen. Uw ontwikkelaars gebruiken Windows-, Linux- en
Mac-computers en gebruiken een GitHub-opslagplaats voor dagelijkse
builds van de toepassingen.

Als onderdeel van de tests wilt u de prestaties van apps vergelijken
voor verschillende gegevensbronnen en voor verschillende typen
gegevensverbindingen. U hebt gemerkt dat wanneer uw ontwikkelteam Azure
Portal gebruikt om een nieuw testexemplaar van de app te maken, ze niet
altijd exact dezelfde parameters gebruiken. U bent van plan dit probleem
op te lossen door voor elke app-test een set
standaardimplementatieopdrachten te gebruiken, die indien nodig kunnen
worden geautomatiseerd en die op dezelfde manier werken op alle
computers die door uw softwareteam worden gebruikt.

In deze module ziet u hoe u Azure-resources kunt beheren met behulp van
de Azure CLI.

## Leerdoelen

In deze module ga je:

- De Azure CLI installeren op Linux, macOS en/of Windows
- Verbinding maken met een Azure-abonnement via de Azure CLI
- Azure-resources maken met de Azure CLI

## Voorwaarden

- Ervaring met een opdrachtregelinterface, zoals PowerShell of Bash
- Kennis van basisconcepten van Azure, zoals resourcegroepen
- Ervaring met het beheren van Azure-resources met behulp van Azure
    Portal

Hulp nodig? Raadpleeg onze [handleiding voor
probleemoplossing](https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.control-azure-services-with-cli.1-introduction&documentId=7a60f3c3-3b7e-ad94-0dcd-299073db8972&versionIndependentDocumentId=4255f283-5803-e011-4ace-b352e4d96f12&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fcontrol-azure-services-with-cli%2F1-introduction.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fcontrol-azure-services-with-cli%2F1-introduction&author=dbradish)
of geef specifieke feedback door [een probleem te
melden](https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.control-azure-services-with-cli.1-introduction&documentId=7a60f3c3-3b7e-ad94-0dcd-299073db8972&versionIndependentDocumentId=4255f283-5803-e011-4ace-b352e4d96f12&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fcontrol-azure-services-with-cli%2F1-introduction.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fcontrol-azure-services-with-cli%2F1-introduction&author=dbradish#report-feedback).

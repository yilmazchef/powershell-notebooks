## Oefening: de Azure CLI installeren en uitvoeren

- 10 minuten

Laten we de Azure CLI op uw lokale computer installeren en vervolgens
een opdracht uitvoeren om uw installatie te controleren. De methode die
u gebruikt voor het installeren van de Azure CLI is afhankelijk van het
besturingssysteem van uw computer. Kies de stappen voor uw
besturingssysteem.

Notitie

Deze oefening begeleidt u bij het lokaal installeren van het Azure
CLI-hulpprogramma. De rest van de module gebruikt de Azure Cloud Shell,
zodat u gebruik kunt maken van de gratis abonnementsondersteuning in
Microsoft Learn. U kunt deze oefening als een optionele activiteit
beschouwen en gewoon de instructies bekijken als u dat wilt.

## Linux

Hier installeert u de Azure CLI op **Ubuntu Linux** met behulp van de
Advanced Packaging Tool (**apt**) en de Bash-opdrachtregel.

Fooi

De onderstaande opdrachten zijn voor Ubuntu versie 18.04. Andere versies
en distributies van Linux hebben andere instructies. Volg de instructies
in [De Azure CLI
installeren](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
als u een andere Linux-versie gebruikt of problemen ondervindt.

1. Wijzig uw bronnenlijst zodat de Microsoft-opslagplaats wordt
    geregistreerd en de pakketbeheerder het Azure CLI-pakket kan vinden.

        AZ_REPO=$(lsb_release -cs)
        echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
        sudo tee /etc/apt/sources.list.d/azure-cli.list

2. Importeer de coderingssleutel voor de Microsoft Ubuntu-opslagplaats.
    Hierdoor kan de pakketbeheerder controleren of het Azure CLI-pakket
    dat u installeert, afkomstig is van Microsoft.

        curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

3. Installeer de Azure CLI.

        sudo apt-get install apt-transport-https
        sudo apt-get update && sudo apt-get install azure-cli

## MacOS

Hier installeert u de Azure CLI op macOS met behulp van de
Homebrew-pakketbeheerder.

Belangrijk

Als de **opdracht brouwen** niet beschikbaar is, moet u mogelijk de
Homebrew-pakketbeheerder installeren. Zie voor meer informatie de
[website van Homebrew](https://brew.sh/).

1. Werk uw brew-opslagplaats bij om ervoor te zorgen dat u het nieuwste
    Azure CLI-pakket krijgt.

        brew update

2. Installeer de Azure CLI.

        brew install azure-cli

## Ramen

Here you will install the Azure CLI on Windows using the MSI installer.

1. Go to <https://aka.ms/installazurecliwindows>, and in the browser
    security dialog box, click **Run**.
2. In the installer, accept the license terms, and then click
    **Install**.
3. In the **User Account Control** dialog, select **Yes**.

## De Azure CLI uitvoeren

U voert de Azure CLI uit door een bash-shell te openen (Linux en macOS)
of vanaf de opdrachtprompt of PowerShell (Windows).

1. Start de Azure CLI en controleer uw installatie door de
    versiecontrole uit te voeren.

        az --version

Tip

Running the Azure CLI from PowerShell has some advantages over running
the Azure CLI from the Windows command prompt. PowerShell provides
additional tab completion features over those available from the command
prompt.

U stelt uw lokale machines in om Azure-resources te beheren met de Azure
CLI. U kunt de Azure CLI nu lokaal gebruiken om opdrachten in te voeren
of scripts uit te voeren. De Azure CLI stuurt uw opdrachten door naar de
Azure-datacenters waar ze worden uitgevoerd binnen uw Azure-abonnement.

------------------------------------------------------------------------

## Volgende eenheid: Werken met de Azure CLI

[Continue](https://docs.microsoft.com/en-us/learn/modules/control-azure-services-with-cli/4-work-with-the-cli/)

Need help? See our [troubleshooting
guide](https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.control-azure-services-with-cli.3-exercise-install-and-run-the-azure-cli&documentId=718d76de-c1a9-1f03-45e0-f15894f98807&versionIndependentDocumentId=1e0d7ae6-8ae5-8dea-0bc9-3231d40b7fdb&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fcontrol-azure-services-with-cli%2F3-exercise-install-and-run-the-azure-cli.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fcontrol-azure-services-with-cli%2F3-exercise-install-and-run-the-azure-cli&author=dbradish)
or provide specific feedback by [reporting an
issue](https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.control-azure-services-with-cli.3-exercise-install-and-run-the-azure-cli&documentId=718d76de-c1a9-1f03-45e0-f15894f98807&versionIndependentDocumentId=1e0d7ae6-8ae5-8dea-0bc9-3231d40b7fdb&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fcontrol-azure-services-with-cli%2F3-exercise-install-and-run-the-azure-cli.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fcontrol-azure-services-with-cli%2F3-exercise-install-and-run-the-azure-cli&author=dbradish#report-feedback).

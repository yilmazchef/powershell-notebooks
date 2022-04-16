## Wat is de Azure CLI?

- 3 minuten

De Azure CLI is een opdrachtregelprogramma om verbinding te maken met Azure en beheeropdrachten uit te voeren op Azure-resources. Het draait op Linux, macOS en Windows en stelt beheerders en ontwikkelaars in staat om hun opdrachten uit te voeren via een terminal of opdrachtregelprompt (of script!) in plaats van een webbrowser. Als u bijvoorbeeld een virtuele machine (VM) opnieuw wilt starten, gebruikt u een opdracht als de volgende:

```
az vm restart -g MyResourceGroup -n MyVm
```

De Azure CLI biedt platformonafhankelijke opdrachtregelprogramma's voor het beheren van Azure-resources en kan lokaal worden geïnstalleerd op Linux-, Mac- of Windows-computers. De Azure CLI kan ook worden gebruikt vanuit een browser via de Azure Cloud Shell. In beide gevallen kan het interactief of gescript worden gebruikt. Voor interactief gebruik start u eerst een shell zoals cmd.exe op Windows of Bash op Linux of macOS en geeft u vervolgens de opdracht uit bij de shellprompt. Om repetitieve taken te automatiseren, voegt u de CLI-opdrachten samen in een shellscript met behulp van de scriptsyntaxis van de door u gekozen shell en voert u het script vervolgens uit.

## De Azure CLI installeren

Op zowel Linux als macOS gebruikt u een pakketbeheerder om de Azure CLI te installeren. De aanbevolen pakketbeheerder verschilt per besturingssysteem en distributie:

- Linux: **apt-get** op Ubuntu, **yum** op Red Hat en **zypper** op OpenSUSE
- Mac: **Homebrew**

De Azure CLI is beschikbaar in de Microsoft-opslagplaats, dus u moet die opslagplaats eerst toevoegen aan uw pakketbeheerder.

In Windows installeert u de Azure CLI door een MSI-bestand te downloaden en uit te voeren.

## De Azure CLI gebruiken in scripts

Als u de Azure CLI-opdrachten in scripts wilt gebruiken, moet u op de hoogte zijn van eventuele problemen rond de 'shell' of omgeving die wordt gebruikt voor het uitvoeren van het script. In een bash-shell wordt bijvoorbeeld de volgende syntaxis gebruikt bij het instellen van variabelen:

```
variable="value"
variable=integer
```

Als u een PowerShell-omgeving gebruikt voor het uitvoeren van Azure CLI-scripts, moet u deze syntaxis gebruiken voor variabelen:

```
$variable="value"
$variable=integer
```

De Azure CLI moet worden geïnstalleerd voordat deze kan worden gebruikt om Azure-resources vanaf een lokale computer te beheren. De installatiestappen variëren voor Windows, Linux en macOS, maar eenmaal geïnstalleerd, zijn de opdrachten gebruikelijk op verschillende platforms.

___

## Volgende eenheid: Oefening - De Azure CLI installeren en uitvoeren

[Voortzetten](https://docs.microsoft.com/en-us/learn/modules/control-azure-services-with-cli/3-exercise-install-and-run-the-azure-cli/)

Hulp nodig? Raadpleeg onze [handleiding voor probleemoplossing](https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.control-azure-services-with-cli.2-what-is-the-azure-cli&documentId=95b9cbdb-2b91-ba1e-a546-f7f74ffef673&versionIndependentDocumentId=0b625c88-ba2d-7934-5d31-11678a037627&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fcontrol-azure-services-with-cli%2F2-what-is-the-azure-cli.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fcontrol-azure-services-with-cli%2F2-what-is-the-azure-cli&author=dbradish) of geef specifieke feedback door [een probleem te melden](https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.control-azure-services-with-cli.2-what-is-the-azure-cli&documentId=95b9cbdb-2b91-ba1e-a546-f7f74ffef673&versionIndependentDocumentId=0b625c88-ba2d-7934-5d31-11678a037627&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fcontrol-azure-services-with-cli%2F2-what-is-the-azure-cli.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fcontrol-azure-services-with-cli%2F2-what-is-the-azure-cli&author=dbradish#report-feedback).

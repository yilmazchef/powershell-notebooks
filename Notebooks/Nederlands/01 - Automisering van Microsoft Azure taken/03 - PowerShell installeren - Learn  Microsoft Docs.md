## PowerShell installeren

-   10 minuten

Stel dat u Azure PowerShell hebt gekozen als uw
automatiseringsoplossing. Uw beheerders geven er de voorkeur aan hun
scripts lokaal uit te voeren in plaats van in de Azure Cloud Shell. Het
team gebruikt machines waarop Linux, macOS en Windows worden uitgevoerd.
U moet Azure PowerShell op al hun apparaten laten werken.

## Wat moet er geïnstalleerd worden?

We zullen de daadwerkelijke installatie-instructies in de volgende
eenheid doornemen, maar laten we eens kijken naar de twee onderdelen
waaruit Azure PowerShell bestaat.

-   **Het basis PowerShell-product** Dit komt in twee varianten: Windows
    PowerShell en PowerShell 7.x, die kunnen worden geïnstalleerd op
    Windows, macOS en Linux.
-   **De Azure Az PowerShell-module** Deze extra module moet worden
    geïnstalleerd om de Azure-specifieke opdrachten toe te voegen aan
    PowerShell.

Fooi

PowerShell 7.0.6 LTS, PowerShell 7.1.3 of hoger is de aanbevolen versie
van PowerShell voor gebruik met de Azure Az PowerShell-module op alle
platforms.

Nadat u het basisproduct hebt geïnstalleerd, voegt u de Azure
PowerShell-module toe aan uw installatie.

## PowerShell-installeren

Op zowel Linux als macOS gebruikt u een pakketbeheerder om PowerShell
Core te installeren. De aanbevolen pakketbeheerder verschilt per
besturingssysteem en distributie.

Notitie

PowerShell is beschikbaar in de Microsoft-opslagplaats, dus u moet die
opslagplaats eerst toevoegen aan uw pakketbeheerder.

### Linux

Op Linux verandert de pakketbeheerder op basis van de Linux-distributie
die u kiest.

  Distributie(s)      Pakketbeheerder
  ------------------- -----------------
  Ubuntu, Debian      `apt-get`
  Rode Hoed, CentOS   `yum`
  OpenSUSE            `zypper`
  Fedora              `dnf`

### Mac

Op macOS gebruikt u PowerShell om te installeren.`Homebrew`

In de volgende sectie doorloopt u de gedetailleerde installatiestappen
voor enkele veelgebruikte platforms.

------------------------------------------------------------------------

## Volgende eenheid: Oefening - Azure PowerShell installeren

[Voortzetten](https://docs.microsoft.com/en-us/learn/modules/automate-azure-tasks-with-powershell/4-exercise-install-azure-powershell/)

Hulp nodig? Raadpleeg onze [handleiding voor
probleemoplossing](https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.automate-azure-tasks-with-powershell.3-install-azure-powershell&documentId=6beb4a01-9235-24b3-932e-140ca2bf4605&versionIndependentDocumentId=9d96943a-586d-71d5-acde-fbc89092b50b&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fautomate-azure-tasks-with-powershell%2F3-install-azure-powershell.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fautomate-azure-tasks-with-powershell%2F3-install-azure-powershell&author=mirobb)
of geef specifieke feedback door [een probleem te
melden](https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.automate-azure-tasks-with-powershell.3-install-azure-powershell&documentId=6beb4a01-9235-24b3-932e-140ca2bf4605&versionIndependentDocumentId=9d96943a-586d-71d5-acde-fbc89092b50b&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fautomate-azure-tasks-with-powershell%2F3-install-azure-powershell.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fautomate-azure-tasks-with-powershell%2F3-install-azure-powershell&author=mirobb#report-feedback).

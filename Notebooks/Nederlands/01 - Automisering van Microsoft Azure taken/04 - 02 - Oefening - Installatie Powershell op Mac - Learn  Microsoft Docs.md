## Oefening - Azure PowerShell installeren

- 10 minuten

In dit toestel leert u hoe u de versie van **PowerShell** kunt controleren die op uw lokale computer is geïnstalleerd en de nieuwste versie kunt installeren.

Notitie

Deze oefening begeleidt u bij het maken van een lokale installatie van PowerShell-hulpprogramma's. De rest van deze module maakt gebruik van de Azure Cloud Shell, zodat u gebruik kunt maken van de gratis abonnementsondersteuning in Microsoft Learn. Als u wilt, beschouwt u deze oefening als een optionele activiteit en bekijkt u gewoon de instructies.

## Linux

Bij het installeren van PowerShell voor Linux moet een pakketbeheerder worden gebruikt. We gebruiken **Ubuntu 18.04** voor ons voorbeeld, maar we hebben [gedetailleerde instructies voor andere versies en distributies in onze documentatie][1].

Installeer PowerShell op Ubuntu Linux met behulp van de Advanced Packaging Tool (**apt**) en de Bash-opdrachtregel.

1. Importeer de coderingssleutel voor de Microsoft Ubuntu-opslagplaats. Met deze sleutel kan pakketbeheer controleren of het PowerShell-pakket dat u installeert, afkomstig is van Microsoft.

    ```bash
    curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
    ```

2. Registreer de **Microsoft Ubuntu-opslagplaats** zodat de pakketbeheerder het PowerShell-pakket kan vinden.

    ```bash
    sudo curl -o /etc/apt/sources.list.d/microsoft.list https://packages.microsoft.com/config/ubuntu/18.04/prod.list
    ```

3. Werk de lijst met pakketten bij.

    ```bash
    sudo apt-get update
    ```

4. Installeer PowerShell.

    ```bash
    sudo apt-get install -y powershell
    ```

5. Start PowerShell om te controleren of het is geïnstalleerd.

    ```bash
    pwsh
    ```

## MacOS

Op macOS installeert u **PowerShell** met behulp van de Homebrew-pakketbeheerder.

Belangrijk

Als de **opdracht brouwen** niet beschikbaar is, moet u mogelijk de Homebrew-pakketbeheerder installeren. Ga voor meer informatie naar de [website van Homebrew][2].

1. Installeer Homebrew-Cask om meer pakketten te verkrijgen, waaronder het PowerShell-pakket:

    ```terminal
    brew install --cask powershell
    ```

2. Start PowerShell om te controleren of het is geïnstalleerd:

    ```terminal
    pwsh
    ```

## Windows

Windows PowerShell is opgenomen in het Windows-besturingssysteem; We raden u echter aan PowerShell 7.0.6 LTS, PowerShell 7.1.3 of hoger te installeren voor gebruik met Azure Az PowerShell. U kunt controleren welke versie is geïnstalleerd met behulp van de volgende stappen:

1. Typ **PowerShell** **in het zoekvak in het systeemvak**. Mogelijk hebt u meerdere snelkoppelingskoppelingen:

    - PowerShell 7 (x64) - De 64-bits versie. Over het algemeen is dit de snelkoppeling die u moet kiezen.
    - Windows PowerShell - De 64-bits versie die bij Windows wordt geleverd.
    - Windows PowerShell (x86) - Een 32-bits versie geïnstalleerd op 64-bits Windows.
    - Windows PowerShell ISE - De Integrated Scripting Environment (ISE) wordt gebruikt voor het schrijven van scripts in Windows PowerShell.
    - Windows PowerShell ISE (x86) - Een 32-bits versie van de ISE op Windows.
2. Selecteer het PowerShell-pictogram dat het beste overeenkomt.

3. Typ de volgende opdracht om te bepalen welke versie van PowerShell is geïnstalleerd.

    ```powershell
    $PSVersionTable.PSVersion
    ```

    _of_

    ```powershell
    pwsh -ver
    ```

    Als het primaire versienummer lager is dan 7, volgt u de instructies om [bestaande Windows PowerShell][3] bij te werken. Het is belangrijk om de SDK ook te installeren om .NET-hulpprogramma's te ondersteunen.

    U moet de [.NET SDK geïnstalleerd hebben][4] om deze opdracht uit te voeren.

    ```powershell
    dotnet tool install --global PowerShell
    ```

    Nadat het hulpprogramma .NET is geïnstalleerd, voert u de PowerShell-versieopdracht opnieuw uit om uw installatie te controleren.

U moet ook uw lokale computer(s) instellen om PowerShell te ondersteunen. In de volgende eenheid bekijken we opdrachten die u kunt toevoegen, waaronder de Azure Az PowerShell-module.

___

## Volgende eenheid: Een Azure-resource maken met scripts in Azure PowerShell

[Voortzetten][5]

Hulp nodig? Raadpleeg onze [handleiding voor probleemoplossing][6] of geef specifieke feedback door [een probleem te melden][7].

[1]: https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux
[2]: https://brew.sh/
[3]: https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows
[4]: https://docs.microsoft.com/en-us/dotnet/core/sdk
[5]: https://docs.microsoft.com/en-us/learn/modules/automate-azure-tasks-with-powershell/5-create-resource-interactively/
[6]: https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.automate-azure-tasks-with-powershell.4-exercise-install-azure-powershell&documentId=2ab44e77-0fd5-fc58-10b1-cd0383103428&versionIndependentDocumentId=3bac99b0-86c7-145b-914d-eff913eb85db&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fautomate-azure-tasks-with-powershell%2F4-exercise-install-azure-powershell.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fautomate-azure-tasks-with-powershell%2F4-exercise-install-azure-powershell&author=mirobb
[7]: https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.automate-azure-tasks-with-powershell.4-exercise-install-azure-powershell&documentId=2ab44e77-0fd5-fc58-10b1-cd0383103428&versionIndependentDocumentId=3bac99b0-86c7-145b-914d-eff913eb85db&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fautomate-azure-tasks-with-powershell%2F4-exercise-install-azure-powershell.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fautomate-azure-tasks-with-powershell%2F4-exercise-install-azure-powershell&author=mirobb#report-feedback

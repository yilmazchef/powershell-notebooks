- 10 minutes

In this unit, you'll learn how to check the version of **PowerShell** installed on your local machine and install the latest version.

Note

This exercise guides you through creating a local installation of PowerShell tools. The remainder of this module uses the Azure Cloud Shell, so you can leverage the free subscription support in Microsoft Learn. If you prefer, consider this exercise as an optional activity and just review the instructions.

## Linux

Installing PowerShell for Linux involves using a package manager. We'll use **Ubuntu 18.04** for our example, but we have [detailed instructions for other versions and distributions in our documentation][1].

Install PowerShell on Ubuntu Linux using the Advanced Packaging Tool (**apt**) and the Bash command line.

1. Import the encryption key for the Microsoft Ubuntu repository. This key enables the package manager to verify that the PowerShell package you install comes from Microsoft.

    ```bash
    curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
    ```

2. Register the **Microsoft Ubuntu repository** so the package manager can locate the PowerShell package.

    ```bash
    sudo curl -o /etc/apt/sources.list.d/microsoft.list https://packages.microsoft.com/config/ubuntu/18.04/prod.list
    ```

3. Update the list of packages.

    ```bash
    sudo apt-get update
    ```

4. Install PowerShell.

    ```bash
    sudo apt-get install -y powershell
    ```

5. Start PowerShell to verify that it installed successfully.

    ```bash
    pwsh
    ```

## macOS

On macOS, install **PowerShell** by using the Homebrew package manager.

Important

If the **brew** command is unavailable, you may need to install the Homebrew package manager. For details, go to the [Homebrew website][2].

1. Install Homebrew-Cask to obtain more packages, including the PowerShell package:

    ```terminal
    brew install --cask powershell
    ```

2. Start PowerShell to verify that it installed successfully:

    ```terminal
    pwsh
    ```

## Windows

Windows PowerShell is included with the Windows operating system; however, we recommend installing PowerShell 7.0.6 LTS, PowerShell 7.1.3, or higher for use with Azure Az PowerShell. You can check which version is installed using the following steps:

1. In the **System tray search box**, type **PowerShell**. You may have multiple shortcut links:

    - PowerShell 7 (x64) - The 64-bit version. Generally, this is the shortcut you should choose.
    - Windows PowerShell - The 64-bit version included with Windows.
    - Windows PowerShell (x86) - A 32-bit version installed on 64-bit Windows.
    - Windows PowerShell ISE - The Integrated Scripting Environment (ISE) is used for writing scripts in Windows PowerShell.
    - Windows PowerShell ISE (x86) - A 32-bit version of the ISE on Windows.
2. Select the best match PowerShell icon.

3. Type the following command to determine the version of PowerShell installed.

    ```powershell
    $PSVersionTable.PSVersion
    ```

    _or_

    ```powershell
    pwsh -ver
    ```

    If the major version number is lower than 7, follow the instructions to [upgrade existing Windows PowerShell][3]. It is important to install the SDK to support .NET tools, as well.

    You need the [.NET SDK installed][4] to run this command.

    ```powershell
    dotnet tool install --global PowerShell
    ```

    After the .NET tool is installed, run the PowerShell version command again to verify your installation.

You will also need to set up your local machine(s) to support PowerShell. In the next unit, we'll review commands you can add, including the Azure Az PowerShell module.

___

## Next unit: Create an Azure Resource using scripts in Azure PowerShell

[Continue][5]

Need help? See our [troubleshooting guide][6] or provide specific feedback by [reporting an issue][7].

[1]: https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux
[2]: https://brew.sh/
[3]: https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows
[4]: https://docs.microsoft.com/en-us/dotnet/core/sdk
[5]: https://docs.microsoft.com/en-us/learn/modules/automate-azure-tasks-with-powershell/5-create-resource-interactively/
[6]: https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.automate-azure-tasks-with-powershell.4-exercise-install-azure-powershell&documentId=2ab44e77-0fd5-fc58-10b1-cd0383103428&versionIndependentDocumentId=3bac99b0-86c7-145b-914d-eff913eb85db&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fautomate-azure-tasks-with-powershell%2F4-exercise-install-azure-powershell.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fautomate-azure-tasks-with-powershell%2F4-exercise-install-azure-powershell&author=mirobb
[7]: https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.automate-azure-tasks-with-powershell.4-exercise-install-azure-powershell&documentId=2ab44e77-0fd5-fc58-10b1-cd0383103428&versionIndependentDocumentId=3bac99b0-86c7-145b-914d-eff913eb85db&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fautomate-azure-tasks-with-powershell%2F4-exercise-install-azure-powershell.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fautomate-azure-tasks-with-powershell%2F4-exercise-install-azure-powershell&author=mirobb#report-feedback

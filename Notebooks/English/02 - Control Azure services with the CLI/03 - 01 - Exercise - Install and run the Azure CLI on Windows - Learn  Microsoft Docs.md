-   10 minutes

Let's install the Azure CLI on your local machine, and then run a
command to verify your installation. The method you use for installing
the Azure CLI depends on the operating system of your computer. Choose
the steps for your operating system.

Note

This exercise guides you through installing the Azure CLI tool locally.
The remainder of the module will use the Azure Cloud Shell so you can
leverage the free subscription support in Microsoft Learn. You can
consider this exercise as an optional activity and just review the
instructions if you prefer.

## Linux

Here you will install the Azure CLI on **Ubuntu Linux** using the
Advanced Packaging Tool (**apt**) and the Bash command line.

Tip

The commands listed below are for Ubuntu version 18.04. Other versions
and distributions of Linux have different instructions. Follow the
instructions in [Install the Azure
CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) if
you are using a different Linux version or have any problems.

1.  Modify your sources list so that the Microsoft repository is
    registered, and the package manager can locate the Azure CLI
    package.

        AZ_REPO=$(lsb_release -cs)
        echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
        sudo tee /etc/apt/sources.list.d/azure-cli.list

2.  Import the encryption key for the Microsoft Ubuntu repository. This
    will allow the package manager to verify that the Azure CLI package
    you install comes from Microsoft.

        curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

3.  Install the Azure CLI.

        sudo apt-get install apt-transport-https
        sudo apt-get update && sudo apt-get install azure-cli

## macOS

Here you will install the Azure CLI on macOS using the Homebrew package
manager.

Important

If the **brew** command is unavailable, you may need to install the
Homebrew package manager. For details see the [Homebrew
website](https://brew.sh/).

1.  Update your brew repository to make sure you get the latest Azure
    CLI package.

        brew update

2.  Install the Azure CLI.

        brew install azure-cli

## Windows

Here you will install the Azure CLI on Windows using the MSI installer.

1.  Go to <https://aka.ms/installazurecliwindows>, and in the browser
    security dialog box, click **Run**.
2.  In the installer, accept the license terms, and then click
    **Install**.
3.  In the **User Account Control** dialog, select **Yes**.

## Running the Azure CLI

You run the Azure CLI by opening a bash shell (Linux and macOS), or from
the command prompt or PowerShell (Windows).

1.  Start the Azure CLI and verify your installation by running the
    version check.

        az --version

Tip

Running the Azure CLI from PowerShell has some advantages over running
the Azure CLI from the Windows command prompt. PowerShell provides
additional tab completion features over those available from the command
prompt.

You set up your local machines to administer Azure resources with the
Azure CLI. You can now use the Azure CLI locally to enter commands or
execute scripts. The Azure CLI will forward your commands to the Azure
datacenters where they will run inside your Azure subscription.

------------------------------------------------------------------------

## Next unit: Work with the Azure CLI

[Continue](https://docs.microsoft.com/en-us/learn/modules/control-azure-services-with-cli/4-work-with-the-cli/)

Need help? See our [troubleshooting
guide](https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.control-azure-services-with-cli.3-exercise-install-and-run-the-azure-cli&documentId=718d76de-c1a9-1f03-45e0-f15894f98807&versionIndependentDocumentId=1e0d7ae6-8ae5-8dea-0bc9-3231d40b7fdb&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fcontrol-azure-services-with-cli%2F3-exercise-install-and-run-the-azure-cli.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fcontrol-azure-services-with-cli%2F3-exercise-install-and-run-the-azure-cli&author=dbradish)
or provide specific feedback by [reporting an
issue](https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.control-azure-services-with-cli.3-exercise-install-and-run-the-azure-cli&documentId=718d76de-c1a9-1f03-45e0-f15894f98807&versionIndependentDocumentId=1e0d7ae6-8ae5-8dea-0bc9-3231d40b7fdb&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fcontrol-azure-services-with-cli%2F3-exercise-install-and-run-the-azure-cli.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fcontrol-azure-services-with-cli%2F3-exercise-install-and-run-the-azure-cli&author=dbradish#report-feedback).

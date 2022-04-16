-   3 minutes

The Azure CLI is a command-line program to connect to Azure and execute
administrative commands on Azure resources. It runs on Linux, macOS, and
Windows and allows administrators and developers to execute their
commands through a terminal or command-line prompt (or script!) instead
of a web browser. For example, to restart a virtual machine (VM), you
would use a command like the following:

    az vm restart -g MyResourceGroup -n MyVm

The Azure CLI provides cross-platform command-line tools for managing
Azure resources, and can be installed locally on Linux, Mac, or Windows
computers. The Azure CLI can also be used from a browser through the
Azure Cloud Shell. In both cases, it can be used interactively or
scripted. For interactive use, you first launch a shell such as cmd.exe
on Windows or Bash on Linux or macOS and then issue the command at the
shell prompt. To automate repetitive tasks, you assemble the CLI
commands into a shell script using the script syntax of your chosen
shell and then execute the script.

## How to install the Azure CLI

On both Linux and macOS, you use a package manager to install the Azure
CLI. The recommended package manager differs by OS and distribution:

-   Linux: **apt-get** on Ubuntu, **yum** on Red Hat, and **zypper** on
    OpenSUSE
-   Mac: **Homebrew**

The Azure CLI is available in the Microsoft repository, so you'll first
need to add that repository to your package manager.

On Windows, you install the Azure CLI by downloading and running an MSI
file.

## Using the Azure CLI in scripts

If you want to use the Azure CLI commands in scripts, you need to be
aware of any issues around the "shell" or environment used for running
the script. For example, in a bash shell, the following syntax is used
when setting variables:

    variable="value"
    variable=integer

If you use a PowerShell environment for running Azure CLI scripts,
you'll need to use this syntax for variables:

    $variable="value"
    $variable=integer

The Azure CLI must be installed before it can be used to manage Azure
resources from a local computer. The installation steps vary for
Windows, Linux, and macOS, but once installed, the commands are common
across platforms.

------------------------------------------------------------------------

## Next unit: Exercise - Install and run the Azure CLI

[Continue](https://docs.microsoft.com/en-us/learn/modules/control-azure-services-with-cli/3-exercise-install-and-run-the-azure-cli/)

Need help? See our [troubleshooting
guide](https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.control-azure-services-with-cli.2-what-is-the-azure-cli&documentId=95b9cbdb-2b91-ba1e-a546-f7f74ffef673&versionIndependentDocumentId=0b625c88-ba2d-7934-5d31-11678a037627&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fcontrol-azure-services-with-cli%2F2-what-is-the-azure-cli.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fcontrol-azure-services-with-cli%2F2-what-is-the-azure-cli&author=dbradish)
or provide specific feedback by [reporting an
issue](https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.control-azure-services-with-cli.2-what-is-the-azure-cli&documentId=95b9cbdb-2b91-ba1e-a546-f7f74ffef673&versionIndependentDocumentId=0b625c88-ba2d-7934-5d31-11678a037627&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fcontrol-azure-services-with-cli%2F2-what-is-the-azure-cli.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fcontrol-azure-services-with-cli%2F2-what-is-the-azure-cli&author=dbradish#report-feedback).

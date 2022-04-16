-   10 minutes

Suppose you've chosen Azure PowerShell as your automation solution. Your
administrators prefer to run their scripts locally rather than in the
Azure Cloud Shell. The team uses machines that run Linux, macOS, and
Windows. You need to get Azure PowerShell working on all their devices.

## What must be installed?

We'll go through the actual installation instructions in the next unit,
but let's look at the two components that make up Azure PowerShell.

-   **The base PowerShell product** This comes in two variants: Windows
    PowerShell and PowerShell 7.x, which can be installed on Windows,
    macOS, and Linux.
-   **The Azure Az PowerShell module** This extra module must be
    installed to add the Azure-specific commands to PowerShell.

Tip

PowerShell 7.0.6 LTS, PowerShell 7.1.3, or higher is the recommended
version of PowerShell for use with the Azure Az PowerShell module on all
platforms.

Once you've installed the base product, you'll then add the Azure
PowerShell module to your installation.

## How to install PowerShell

On both Linux and macOS, you'll use a package manager to install
PowerShell Core. The recommended package manager differs by OS and
distribution.

Note

PowerShell is available in the Microsoft repository, so you'll first
need to add that repository to your package manager.

### Linux

On Linux, the package manager will change based on the Linux
distribution you choose.

  Distribution(s)   Package manager
  ----------------- -----------------
  Ubuntu, Debian    `apt-get`
  Red Hat, CentOS   `yum`
  OpenSUSE          `zypper`
  Fedora            `dnf`

### Mac

On macOS, you'll use `Homebrew` to install PowerShell.

In the next section, you'll go through the detailed installation steps
for some common platforms.

------------------------------------------------------------------------

## Next unit: Exercise - Install Azure PowerShell

[Continue](https://docs.microsoft.com/en-us/learn/modules/automate-azure-tasks-with-powershell/4-exercise-install-azure-powershell/)

Need help? See our [troubleshooting
guide](https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.automate-azure-tasks-with-powershell.3-install-azure-powershell&documentId=6beb4a01-9235-24b3-932e-140ca2bf4605&versionIndependentDocumentId=9d96943a-586d-71d5-acde-fbc89092b50b&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fautomate-azure-tasks-with-powershell%2F3-install-azure-powershell.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fautomate-azure-tasks-with-powershell%2F3-install-azure-powershell&author=mirobb)
or provide specific feedback by [reporting an
issue](https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.automate-azure-tasks-with-powershell.3-install-azure-powershell&documentId=6beb4a01-9235-24b3-932e-140ca2bf4605&versionIndependentDocumentId=9d96943a-586d-71d5-acde-fbc89092b50b&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fautomate-azure-tasks-with-powershell%2F3-install-azure-powershell.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fautomate-azure-tasks-with-powershell%2F3-install-azure-powershell&author=mirobb#report-feedback).

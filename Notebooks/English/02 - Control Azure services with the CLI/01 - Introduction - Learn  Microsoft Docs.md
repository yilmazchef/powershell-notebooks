- 3 minutes

The Azure portal is great for performing single tasks, and to see a
quick overview of the state of your resources. But for tasks that need
to be repeated daily, or even hourly, using the command line and a set
of tested commands or scripts can help get your work done more quickly
and avoid errors.

Suppose you work at a company that develops Azure Web Apps. These are
applications hosted in Azure, with all the benefits of automatically
configured security, load balancing, management, and so on. You're
currently testing a web app that generates sales forecasts, based on a
range of inputs from different databases and other data sources. Your
developers use Windows, Linux, and Mac computers, and use a GitHub
repository for daily builds of the applications.

As part of the testing, you want to compare app performance for
different data sources, and for different types of data connections.
You've noticed that when your development team uses the Azure portal to
create a new test instance of the app, they don't always use exactly the
same parameters. You plan to solve this problem by using a set of
standard deployment commands for each app test, which can be automated
if required, and which will work in the same way across all the
computers used by your software team.

In this module, you'll see how to manage Azure resources using the Azure
CLI.

## Learning objectives

In this module, you will:

- Install the Azure CLI on Linux, macOS, and/or Windows
- Connect to an Azure subscription using the Azure CLI
- Create Azure resources using the Azure CLI

## Prerequisites

- Experience with a command-line interface, such as PowerShell or Bash
- Knowledge of basic Azure concepts, such as resource groups
- Experience administering Azure resources using the Azure portal

------------------------------------------------------------------------

## Next unit: What is the Azure CLI?

[Continue](https://docs.microsoft.com/en-us/learn/modules/control-azure-services-with-cli/2-what-is-the-azure-cli/)

Need help? See our [troubleshooting
guide](https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.control-azure-services-with-cli.1-introduction&documentId=7a60f3c3-3b7e-ad94-0dcd-299073db8972&versionIndependentDocumentId=4255f283-5803-e011-4ace-b352e4d96f12&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fcontrol-azure-services-with-cli%2F1-introduction.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fcontrol-azure-services-with-cli%2F1-introduction&author=dbradish)
or provide specific feedback by [reporting an
issue](https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.control-azure-services-with-cli.1-introduction&documentId=7a60f3c3-3b7e-ad94-0dcd-299073db8972&versionIndependentDocumentId=4255f283-5803-e011-4ace-b352e4d96f12&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fcontrol-azure-services-with-cli%2F1-introduction.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fcontrol-azure-services-with-cli%2F1-introduction&author=dbradish#report-feedback).

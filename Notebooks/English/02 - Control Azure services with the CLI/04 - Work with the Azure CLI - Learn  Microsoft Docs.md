-   5 minutes

The Azure CLI lets you type commands and execute them immediately from
the command line. Recall that the overall goal in the software
development example is to deploy new builds of a web app for testing.
Let's talk about the sorts of tasks you can do with the Azure CLI.

## What Azure resources can be managed using the Azure CLI?

The Azure CLI lets you control nearly every aspect of every Azure
resource. You can work with resource groups, storage, virtual machines,
Azure Active Directory (Azure AD), containers, machine learning, and so
on.

Commands in the CLI are structured in *groups* and *subgroups*. Each
group represents a service provided by Azure, and the subgroups divide
commands for these services into logical groupings. For example, the
`storage` group contains subgroups including **account**, **blob**, and
**queue**.

So, how do you find the particular commands you need? One way is to use
`az find`, the AI robot that uses the Azure documentation to tell you
more about commands, the CLI and more.

Example - find the most popular commands related to the word **blob**.

    az find blob

Example - Show me the most popular commands for an Azure CLI command
group, such as `az vm`.

    az find "az vm"

Example - Show me the most popular parameters and subcommands for an
Azure CLI command.

    az find "az vm create"

If you already know the name of the command you want, the `--help`
argument for that command will get you more detailed information on the
command, and for a command group, a list of the available subcommands.
So, with our storage example, here's how you can get a list of the
subgroups and commands for managing blob storage:

    az storage blob --help

## How to create an Azure resource

When creating a new Azure resource, there are typically three steps:
connect to your Azure subscription, create the resource, and verify that
creation was successful. The following illustration shows a high-level
overview of the process.

![An illustration showing the steps to create an Azure resource using
the command-line
interface.](Work%20with%20the%20Azure%20CLI%20-%20Learn%20%20Microsoft%20Docs/media4-create-resources-overview.png)

Each step corresponds to a different Azure CLI command.

### Connect

Since you're working with a local install of the Azure CLI, you'll need
to authenticate before you can execute Azure commands, by using the
Azure CLI **login** command.

    az login

The Azure CLI will typically launch your default browser to open the
Azure sign-in page. If this doesn't work, follow the command-line
instructions and enter an authorization code at
<https://aka.ms/devicelogin>.

After a successful sign in, you'll be connected to your Azure
subscription.

### Create

You'll often need to create a new resource group before you create a new
Azure service, so we'll use resource groups as an example to show how to
create Azure resources from the CLI.

The Azure CLI **group create** command creates a resource group. You
must specify a name and location. The name must be unique within your
subscription. The location determines where the metadata for your
resource group will be stored. You use strings like "West US", "North
Europe", or "West India" to specify the location; alternatively, you can
use single word equivalents, such as westus, northeurope, or westindia.
The core syntax is:

    az group create --name <name> --location <location>

Important

You do not need to create a resource group when using the free Azure
sandbox. Instead, you will use a pre-created resource group.

### Verify

For many Azure resources, the Azure CLI provides a **list** subcommand
to view resource details. For example, the Azure CLI **group list**
command lists your Azure resource groups. This is useful here to verify
whether creation of the resource group was successful:

    az group list

To get a more concise view, you can format the output as a simple table:

    az group list --output table

------------------------------------------------------------------------

## Next unit: Exercise - Create an Azure website using the CLI

[Continue](https://docs.microsoft.com/en-us/learn/modules/control-azure-services-with-cli/5-exercise-create-website-using-the-cli/)

Need help? See our [troubleshooting
guide](https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.control-azure-services-with-cli.4-work-with-the-cli&documentId=48fd4bcd-d5b8-38e4-1e06-e122d1e91a57&versionIndependentDocumentId=5d11169e-5774-d236-2d82-08d547a3a5a7&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fcontrol-azure-services-with-cli%2F4-work-with-the-cli.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fcontrol-azure-services-with-cli%2F4-work-with-the-cli&author=dbradish)
or provide specific feedback by [reporting an
issue](https://docs.microsoft.com/en-us/learn/support/troubleshooting?uid=learn.control-azure-services-with-cli.4-work-with-the-cli&documentId=48fd4bcd-d5b8-38e4-1e06-e122d1e91a57&versionIndependentDocumentId=5d11169e-5774-d236-2d82-08d547a3a5a7&contentPath=%2FMicrosoftDocs%2Flearn-pr%2Fblob%2Flive%2Flearn-pr%2Fazure%2Fcontrol-azure-services-with-cli%2F4-work-with-the-cli.yml&url=https%3A%2F%2Fdocs.microsoft.com%2Fen-us%2Flearn%2Fmodules%2Fcontrol-azure-services-with-cli%2F4-work-with-the-cli&author=dbradish#report-feedback).

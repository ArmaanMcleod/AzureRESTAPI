# Azure REST API

PowerShell scripts to test out HTTP methods GET, POST, PUT, DELETE and HEAD  with Azure REST API.

The full guide can be found at [Azure REST API Reference](https://docs.microsoft.com/en-us/rest/api/azure/).

## Authentication

1. Install [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest) and login to your Azure account with the following command:

    `PS C:\> az login`

2. Set your active subscription with:

    `PS C:\> az account set --subscription "<YOUR SUBSCRIPTION NAME>"`

3. Create a Service Principal:

    `PS C:\> az ad sp create-for-rbac -n "<YOUR SERVICE PRINCIPAL NAME>"`

4. Create a `azureADAuth.json` file to insert *tenant id*, *application id*, *password* and *subscription id* from Step 3:
    ```
    {
        "tenantId": "<TENANT ID>",
        "appId": "<APPLICATION ID>",
        "secret": "<PASSWORD>",
        "subscriptionId": "<SUBSCRIPTION ID>"
    }
    ```

## Testing

You can now run the scripts inside the `scripts` folder. 

    
# Azure REST API

PowerShell scripts to test out HTTP methods GET, POST, PUT, DELETE and HEAD  with Azure REST API.

## Authentication

1. Set up Azure AD authentication with a registered app with [Authorize access to Azure Active Directory web applications using the OAuth 2.0 code grant flow](https://docs.microsoft.com/en-us/azure/active-directory/develop/v1-protocols-oauth-code). This is needed to grant access tokens to accessing the REST API. 

2. Create a `azureADAuth.json` file to hold your registered app *tenant id*, *application id*, *secret* and *subscription id*:
```
{
    "tenantId": "<TENANT ID>",
    "appId": "<APPLICATION ID>",
    "secret": "<SECRET KEY>",
    "subscriptionId": "<SUBSCRIPTION ID>"
}
```

Now you can run the PowerShell scripts in the `scripts` folder and see what happens. 
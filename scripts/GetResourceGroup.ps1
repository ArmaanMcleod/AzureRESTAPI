# Resource group variables
$resourceGroupName = "myResourceGroup"

# Check if auth file exists
$parent = Test-Path -Path "..\azureADAuth.json"
$current = Test-Path -Path "azureADAuth.json"

# Exit when file doesn't exist
if (-not $parent -and -not $current) {
    Write-Error "Missing azureADAuth file from directory"
    exit
}

$authFile = if ($parent -eq $true) {"..\azureADAuth.json"} else {"azureADAuth.json"}

# Get auth file properties
$authority = Get-Content -Path $authFile | ConvertFrom-Json

# Auth token uri
$authUri = "https://login.microsoftonline.com/$($authority.tenantId)/oauth2/token?api-version=1.0"

# Resource group url
$resourceUri = "https://management.azure.com/subscriptions/$($authority.subscriptionId)/resourcegroups/${resourceGroupName}?api-version=2019-08-01"

# Token request body
$body = @{
    grant_type = "client_credentials";
    resource = "https://management.core.windows.net/";
    client_id = $authority.appId;
    client_secret = $authority.password;
}

# POST request to get auth token
try {
    $result = Invoke-RestMethod `
        -Uri $authUri `
        -Method Post `
        -Body $body
} catch {
    Write-Host "StatusCode:" $_.Exception.Response.StatusCode.value__ 
    Write-Host "StatusDescription:" $_.Exception.Response.StatusDescription
    exit
}

$token = $result.access_token

# Get headers and body of request
$headers = @{
  authorization = "Bearer $token"
  host = "management.azure.com"
}

# GET request to REST api
try {
    Invoke-RestMethod `
        -Uri $resourceUri `
        -Headers $headers `
        -Method Get
} catch {
    Write-Host "StatusCode:" $_.Exception.Response.StatusCode.value__ 
    Write-Host "StatusDescription:" $_.Exception.Response.StatusDescription
}
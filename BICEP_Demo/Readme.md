# Bicep Build

## Build

The ```build``` command converts a Bicep file to an Azure Resource Manager template (ARM template).
Typically, you don't need to run this command because it runs automatically when you deploy a Bicep file. 
Run it manually when you want to see the ARM template JSON that is created from your Bicep file.

The following example converts a Bicep file named main.bicep to an ARM template named main.json. 
The new file is created in the same directory as the Bicep file.

```
  az bicep build --file main.bicep
```

## Github Actions also support build and deployment process

Example of gihub action implemented in this repo: 

```
   name: Build bicep file

  on:
  # run it on push to the default repository branch
    push:
      branches: 
        - 'bicep**'
  
  
  jobs:
    deploy:
      name: Build and Deploy Bicep
      runs-on:  ubuntu-latest
      steps:
          - name: Azure Login
            uses: azure/login@v2
            with:
              creds: '{"clientId":"${{ secrets.AZURE_CLIENT_ID }}","clientSecret":"${{ secrets.AZURE_CLIENT_SECRET }}","subscriptionId":"${{ secrets.AZURE_SUBSCRIPTION_ID }}","tenantId":"${{ secrets.AZURE_TENANT_ID }}"}'
      
          - name: Checkout
            uses: actions/checkout@v1
          
          - name: Bicep Build
            uses: aliencube/bicep-build-actions@v0.3
            with:
              # List of .bicep files to build, delimited by a space. eg) file1 file2 file3 ...
              files: BICEP_Demo/rg.bicep BICEP_Demo/rg.bicep
              # Version of the bicep CLI. It can be the exact version (eg. `v0.3.255`), wildcard (eg. `v0.3.x`) or `latest`. If omitted, `latest` is set as default.
              version: 'latest'

          - name: Azure CLI script
            uses: azure/cli@v2
            with:
              azcliversion: 2.30.0
              inlineScript: |
                          az deployment sub create --location eastus --template-file BICEP_Demo/rg.bicep && \
                          az deployment group create --resource-group azurebootcamp --template-file BICEP_Demo/main.bicep
```
Results of action execution shown:


![Bicep_build_Github_action](https://github.com/LeonidChetverikov/azurebootcamp/assets/34073185/e2e33fd7-22ad-4d43-9035-c0f897968d29)

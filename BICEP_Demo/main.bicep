targetScope = 'subscription'

param resourceGroupName string = 'myResourceGroup'
param storageAccountName string = 'azurebootcampdemo'
param location string = 'eastus'
param sku string = 'Standard_LRS'

resource newResourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
name: resourceGroupName
location: lacation
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
name: storageAccountName
location: location
sku: {
name: sku
}
kind: 'StorageV2'
properties: {
supportsHttpsTrafficOnly: true
}
}

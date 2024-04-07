
targetScope = 'subscription'

param resourceGroupName string = 'azurebootcamp'
param resourceGroupLocation string = 'eastue'

resource newResourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
name: resourceGroupName
location: resourceGroupLocation
}

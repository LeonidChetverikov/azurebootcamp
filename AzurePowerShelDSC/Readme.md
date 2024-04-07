# Azure portal deployment

By Default create a new resource group using cloud shell -> PowerShell
```
      New-AzResourceGroup -Name azurebootcamp-resource-group -Location "eastus"
```
Create a new Virtual Mashine:
```
      New-AzVm -ResourceGroupName 'azurebootcamp-resource-group' `
               -Credential (Get-Credential) `
               -Name 'dsc-eastus-vm' `
               -Location 'eastus' `
               -Image 'MicrosoftWindowsServer:WindowsServer:2022-datacenter-azure-edition:latest' `
               -VirtualNetworkName 'azurebootcamp-eastus-vnet' `
               -SubnetName 'azurebootcamp-eastus-subnet' `
               -SecurityGroupName 'azurebootcamp-eastus-nsg' `
               -PublicIpAddressName 'azurebootcamp-eastus-pip' `
               -OpenPorts 80,3389
```
![CreatingVM](https://github.com/LeonidChetverikov/azurebootcamp/assets/34073185/0f19bcad-baae-4598-8d4d-9d901bfbfb6e)


1. Go to a VM.

2. Under Settings, select *Extensions* + *Applications*.

3. Under *Extensions*, select + **Add**.

4. Select **PowerShell Desired State Configuration**, then select *Next*.

5. Configure the following parameters for the **DSC extension**.
   


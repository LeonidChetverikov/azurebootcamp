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
![VMCreated](https://github.com/LeonidChetverikov/azurebootcamp/assets/34073185/533dafd6-7aab-47e6-a73e-87d49dc99b34)



1. Go to a VM.

2. Under Settings, select *Extensions* + *Applications*.

3. Under *Extensions*, select + **Add**.

4. Select **PowerShell Desired State Configuration**, then select *Next*.

![Extensions](https://github.com/LeonidChetverikov/azurebootcamp/assets/34073185/8db3b5cf-8319-49a2-ab74-24810d30ef09)
![Next](https://github.com/LeonidChetverikov/azurebootcamp/assets/34073185/79439736-749b-4c8c-812a-693c1b9f477b)



5. Configure the following parameters for the **DSC extension**.
   ![Configuration](https://github.com/LeonidChetverikov/azurebootcamp/assets/34073185/d4e500ce-0fec-412b-8ae1-e7bed3708717)

Check that DSC is applied:

![DSCApplied](https://github.com/LeonidChetverikov/azurebootcamp/assets/34073185/47576627-b1a5-4103-8aad-d00d196dbcad)

# Visit default IIS page


   


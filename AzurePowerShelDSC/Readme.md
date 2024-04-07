# Azure portal deployment

By Default create a new resource group using cloud shell -> PowerShell
```
      New-AzResourceGroup -Name azurebootcamp-resource-group -Location "eastus"
```

1. Go to a VM.

2. Under Settings, select *Extensions* + *Applications*.

3. Under *Extensions*, select + **Add**.

4. Select **PowerShell Desired State Configuration**, then select *Next*.

5. Configure the following parameters for the **DSC extension**.
   


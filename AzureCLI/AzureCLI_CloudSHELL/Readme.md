You can serve static content (HTML, CSS, JavaScript, and image files) directly from a container in a general-purpose V2 or BlockBlobStorage account. 
To learn more, see [Static website hosting in Azure Storage](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-static-website).

1. Azure Cloud Shell is a free Bash shell that you can run directly within the Azure portal. Select the Cloud Shell button on the menu in the upper-right section of the Azure portal:
![https://portal.azure.com](https://learn.microsoft.com/en-us/azure/storage/common/media/storage-quickstart-create-account/cloud-shell-menu.png)
   The button launches an interactive shell that you can use to run the steps outlined in this how-to article:
![https://portal.azure.com](https://github.com/LeonidChetverikov/azurebootcamp/assets/34073185/bd52bf29-9a8e-49f0-9a52-7e515d3a7281)
2. To create a general-purpose v2 storage account with Azure CLI, first create a new resource group by calling the az group create command.
  ``` az group create --name storage-resource-group --location eastus ```


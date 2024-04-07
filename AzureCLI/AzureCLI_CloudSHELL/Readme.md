You can serve static content (HTML, CSS, JavaScript, and image files) directly from a container in a general-purpose V2 or BlockBlobStorage account. 
To learn more, see [Static website hosting in Azure Storage](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-static-website).

1. Azure Cloud Shell is a free Bash shell that you can run directly within the Azure portal. Select the Cloud Shell button on the menu in the upper-right section of the Azure portal:
![https://portal.azure.com](https://learn.microsoft.com/en-us/azure/storage/common/media/storage-quickstart-create-account/cloud-shell-menu.png)
   The button launches an interactive shell that you can use to run the steps outlined in this how-to article:
![https://portal.azure.com](https://github.com/LeonidChetverikov/azurebootcamp/assets/34073185/bd52bf29-9a8e-49f0-9a52-7e515d3a7281)
2. To create a general-purpose v2 storage account with Azure CLI, first create a new resource group by calling the az group create command.

   ```
      az group create --name azurebootcamp-resource-group --location eastus
   ```

4. Create a standard general-purpose v2 storage account with read-access geo-redundant storage by using the az storage account create command. Remember that the name of your storage account must be unique across Azure. Replace the placeholder(azurebootcamp080424) value with your own unique value

   ```
      az storage account create  --name azurebootcamp080424 \
                                 --resource-group azurebootcamp-resource-group \
                                 --location eastus --sku Standard_RAGRS \
                                 --kind StorageV2 \
                                 --allow-blob-public-access true
   ```
   
![Running](https://github.com/LeonidChetverikov/azurebootcamp/assets/34073185/bc478b72-3fb1-4433-b6f2-68f7bde27fd1)
![Finished](https://github.com/LeonidChetverikov/azurebootcamp/assets/34073185/26ad1968-b6c3-4784-beb2-a5c5111b1480)

4. Enable static website hosting.

   ```
      az storage blob service-properties update  --account-name azurebootcamp080424 \
                                                 --static-website --404-document error.html \
                                                 --index-document static-azurebootcamp.html
   ```
![Results](https://github.com/LeonidChetverikov/azurebootcamp/assets/34073185/5751e9b6-ec05-44ce-a3b8-6246df5fc3a7)

5. Upload objects to the $web container from a source directory.

   ```
      mkdir site && \
      wget https://raw.githubusercontent.com/LeonidChetverikov/azurebootcamp/main/file/slides-minimal-00b341.html --output-document=site/static-azurebootcamp.html && \
      az storage blob upload-batch -s site -d '$web' --account-name azurebootcamp080424
   ```
![ResultsOfFileUpload](https://github.com/LeonidChetverikov/azurebootcamp/assets/34073185/e974eea9-ddab-4ee7-ac68-68b48b9b8eb5)

6. Find the public URL of your static website by using the following command:
   ```
      az storage account show -n azurebootcamp080424 \
                              -g azurebootcamp-resource-group \
                              --query "primaryEndpoints.web" --output tsv
   ```
   ![Link_and_open]()

   



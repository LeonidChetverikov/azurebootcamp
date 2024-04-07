You can use Docker to run a standalone Linux container with the Azure CLI preinstalled. Docker gets you started quickly with an isolated environment to run the CLI in. 
The image can also be used as a base for your own deployments.
# Start the Docker container with Azure CLI preinstalled
1. Open a command prompt and then start the Docker container with Azure CLI preinstalled using the following command.
   ```
       docker run -it mcr.microsoft.com/azure-cli
   ```
![Docker_Image_run](https://github.com/LeonidChetverikov/azurebootcamp/assets/34073185/f78e9baf-2be9-4b64-b0f0-30723b65a35a)

2. Authentificate yourself using az shell
   ```
      az login --use-device-code
   ```
   ![Auth](https://github.com/LeonidChetverikov/azurebootcamp/assets/34073185/9348e96d-b90e-481f-ac1a-e4d93c919e08)
   Open in Web Browser page: [https://microsoft.com/devicelogin](https://microsoft.com/devicelogin) and enter * code shown *.
   ![AuthScreen](https://github.com/LeonidChetverikov/azurebootcamp/assets/34073185/ef8432e4-f497-41f7-a332-4e0d2101a35f)
   ![SuccessAuth](https://github.com/LeonidChetverikov/azurebootcamp/assets/34073185/477b19d2-c545-4c68-acbd-3b2f573cf80a)
<details>
   <summary>Docker deployment of static wesite using azure CLI</summary>

4. To create a general-purpose v2 storage account with Azure CLI, first create a new resource group by calling the az group create command.

   ```
      az group create --name azurebootcamp-resource-group --location eastus
   ```

5. Create a standard general-purpose v2 storage account with read-access geo-redundant storage by using the az storage account create command. Remember that the name of your storage account must be unique across Azure. Replace the placeholder(azurebootcamp080424) value with your own unique value

   ```
      az storage account create  --name azurebootcamp080424 \
                                 --resource-group azurebootcamp-resource-group \
                                 --location eastus --sku Standard_RAGRS \
                                 --kind StorageV2 \
                                 --allow-blob-public-access true
   ```

5. Enable static website hosting.

   ```
      az storage blob service-properties update  --account-name azurebootcamp080424 \
                                                 --static-website --404-document error.html \
                                                 --index-document static-azurebootcamp.html
   ```

6. Upload objects to the $web container from a source directory.

   ```
      mkdir site && \
      wget https://raw.githubusercontent.com/LeonidChetverikov/azurebootcamp/main/file/slides-minimal-00b341.html --output-document=site/static-azurebootcamp.html && \
      az storage blob upload-batch -s site -d '$web' --account-name azurebootcamp080424
   ```

7. Find the public URL of your static website by using the following command:
   ```
      az storage account show -n azurebootcamp080424 \
                              -g azurebootcamp-resource-group \
                              --query "primaryEndpoints.web" --output tsv
   ```

</details>

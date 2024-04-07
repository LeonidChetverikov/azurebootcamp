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

3. To create a general-purpose v2 storage account with Azure CLI, first create a new resource group by calling the az group create command.

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

5. Enable static website hosting.

   ```
      az storage blob service-properties update  --account-name azurebootcamp080424 \
                                                 --static-website --404-document error.html \
                                                 --index-document static-azurebootcamp.html
   ```
![Results](https://github.com/LeonidChetverikov/azurebootcamp/assets/34073185/5751e9b6-ec05-44ce-a3b8-6246df5fc3a7)

6. Upload objects to the $web container from a source directory.

   ```
      mkdir site && \
      wget https://raw.githubusercontent.com/LeonidChetverikov/azurebootcamp/main/file/slides-minimal-00b341.html --output-document=site/static-azurebootcamp.html && \
      az storage blob upload-batch -s site -d '$web' --account-name azurebootcamp080424
   ```
![ResultsOfFileUpload](https://github.com/LeonidChetverikov/azurebootcamp/assets/34073185/e974eea9-ddab-4ee7-ac68-68b48b9b8eb5)

7. Find the public URL of your static website by using the following command:
   ```
      az storage account show -n azurebootcamp080424 \
                              -g azurebootcamp-resource-group \
                              --query "primaryEndpoints.web" --output tsv
   ```
   ![Link_and_open](https://github.com/LeonidChetverikov/azurebootcamp/assets/34073185/481115dd-59c6-4893-9107-ccabf6c46fd7)



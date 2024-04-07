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




Configuration BasicWebServer {
# Import the required DSC resources
Import-DscResource -ModuleName 'PSDesiredStateConfiguration'

# The Node block specifies the target node to configure
Node 'localhost' {
# Ensure the IIS role is installed
WindowsFeature IIS {
Ensure = 'Present'
Name   = 'Web-Server'
}

# Ensure the specified website path exists
File WebsitePath {
Ensure          = 'Present'
Type            = 'Directory'
DestinationPath = 'C:\inetpub\wwwroot\MyWebsite'
}

# Ensure the IIS service is running
Service IIS {
Ensure    = 'Present'
Name      = 'W3SVC'
DependsOn = '[WindowsFeature]IIS'
}
}
}

# Compile the configuration into a .mof file
BasicWebServer -OutputPath 'C:\DSC\BasicWebServer'

# Apply the configuration to the target node
Start-DscConfiguration -Path 'C:\DSC\BasicWebServer' -Wait -Verbose

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$apiKey="your_api_key_id"
$apiSecret="your_api_secret_key"
$encode64='Basic ' + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$($apiKey):$($apiSecret)"))

$params = @{uri = 'https://api.cloudpassage.com/oauth/access_token?grant_type=client_credentials';
            Method = 'Post';
            Headers = @{Authorization = $encode64;}
           }

$auth = Invoke-RestMethod @params
$token = $auth.access_token


$header = @{Authorization = "Bearer $token";
            ContentType = "application/json;charset=UTF=8";
           }

$request = @{uri = 'https://api.cloudpassage.com/v2/installers/windows';
             Method = 'Get';
             Headers = $header;
            }
$response = Invoke-RestMethod @request
$windows_agent_version = $response.windows_agent_version
$new_windows_agent = $response.windows_installer
$new_agent_file_name = "cphalo-" + $windows_agent_version + "-win64.exe"
$configure_switch = "/S"
#write-host $windows_agent_version
#write-host $new_agent_file_name
$installed_halo =(Get-ItemProperty "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\cphalo").DisplayVersion

if (-NOT ($windows_agent_version -eq $installed_halo)){
    Invoke-WebRequest -Uri $new_windows_agent -OutFile .\$new_agent_file_name
    &.\$new_agent_file_name $configure_switch
}

# Auto-update Halo agent via cron
Version: *1.0*
<br />
Author: *Sean Nicholson*

# Description
The bash script files will create a cron job to update Halo via the system's
package management (yum or apt). There are two files for each, one that creates
the job to run weekly and another to run monthly. Choose the file that best
fits your operation environment and updating requirements/restrictions.

If you are going to use these scripts in an elastic environment or your
instances are short lived you may want to configure something similar to run
on system boot after networking is online.

#Windows Powershell script
update_halo.ps1
You will need to configure your Halo API Key and Secret Key on lines 2 and 3
  >$apiKey="your_api_key_id"
  $apiSecret="your_api_secret_key"

Depending on your security configuration you may have to sign the script once
you have configured the API Key information.
This script will connect to the Halo API to determine the latest version of the
Windows agent and compare to the currently installed Halo Windows Agent. If the
version on the Halo API site is newer, the script will download and install the
new agent. The file is downloaded to the directory in which the script is
running from. This script will need to run with Administrator privileges as it
will be running the downloaded version of the agent. If the current version is
already installed the script will exit with no actions.

It is recommended if you are going to run this script to auto-update your
installed Halo agent, then set a schedule to either run weekly, biweekly, or
monthly depending on your requirements. This can be configured in the Windows
Task Scheduler when creating the task to run the powershell script.


## License

Copyright (c) 2017, CloudPassage, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the CloudPassage, Inc. nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL CLOUDPASSAGE, INC. BE LIABLE FOR ANY DIRECT,
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED ANDON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


######################################################## 
# Script Family: AWS Tools                             # 
# Stop a runnning AWS VM instance                      #
# Author: Herb Brown                                   # 
# Date: 07/15/2016                                     # 
# Version: 0.1                                         #
# Modified: HRB 07/15/2016                             #
########################################################
### AWS-Tools ###
<#
.Synopsis
<!<Model N requested start stop switches for AWS machines.>!>
.DESCRIPTION
<!<This is the start switch.>!>
.EXAMPLE
<!<SnippetExample>!>
.EXAMPLE
<!<SnippetAnotherExample>!>
#>
function AWS-Start
{
    [CmdletBinding()]
    [OutputType([int])]
    param
    (
        # <!<SnippetParam1Help>!>
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true,Position=0)]
        $MNAiid #,
        # <!<SnippetParam2Help>!>
        #[int]$parameter2
		)

        Begin
        {
          
        }

        Process
        {
          Start-EC2Instance -Instance $MNAiid
        }

        End
        {

        }
}
function AWS-Stop
{
    [CmdletBinding()]
    [OutputType([int])]
    param
    (
        # <!<SnippetParam1Help>!>
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true,Position=0)]
        $MNAiid #,
        # <!<SnippetParam2Help>!>
        #[int]$parameter2
		)

        Begin
        {
          
        }

        Process
        {
          Stop-EC2Instance -Instance $MNAiid
        }

        End
        {

        }
}
function AWS-StopList
{
#    [CmdletBinding()]
#    [OutputType([int])]
<#    param
    (
        # <!<SnippetParam1Help>!>
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true,Position=0)]
        $parameter1,

        # <!<SnippetParam2Help>!>
        [int]$parameter2)
#>
        Begin
        {
			# stopped filter
			$MNAstp = New-Object Amazon.EC2.Model.Filter
			$MNAstp.Name = 'instance-state-code'
			$MNAstp.Value = 80
			# Page setup
			$a = "<style>"
			$a = $a + "BODY{background-color:peachpuff;}"
			$a = $a + "TABLE{border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}"
			$a = $a + "TH{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:thistle}"
			$a = $a + "TD{border-width: 1px;padding: 0px;border-style: solid;border-color: black;background-color:palegoldenrod}"
			$a = $a + "</style>"
        }

        Process
        {
			
			(Get-EC2Instance -Filter $MNAstp).Instances | Select-Object InstanceId, PrivateIpAddress, PublicIpAddress | ConvertTo-HTML -head $a | Out-File C:\inetpub\wwwroot\Test.htm

        }

        End
        {

        }
}

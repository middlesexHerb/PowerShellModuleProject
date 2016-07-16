
######################################################## 
# Script Family: AWS Tools                             # 
# Stop a runnning AWS VM instance                      #
# Author: Herb Brown                                   # 
# Date: 07/15/2016                                     # 
# Version: 0.1                                         #
# Modified: HRB 07/15/2016                             #
########################################################
### AWS-stop ###
<#
.Synopsis
<!<Model N requested start stop switches for AWS machines.>!>
.DESCRIPTION
<!<This is the stop switch.>!>
.EXAMPLE
<!<SnippetExample>!>
.EXAMPLE
<!<SnippetAnotherExample>!>
#>
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

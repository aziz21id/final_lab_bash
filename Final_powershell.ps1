#done by Abdulaziz Bin Nayel

#Secure 17

#this function provides the user with some information and then print it out to survey.txt
function gather-systeminfo {

param (
[switch] $nameofcomputer, #prvides computer name
[switch]  $newDate,       #prvides the date
[switch]  $osversion,     #prvides the running process grouped by Session#
[switch]  $allprocess,     #prvides computer name
[switch]  $sockets          
      )
$nameofcomputer = $env:computername > survey.txt
$newDate = Get-Date  >> survey.txt
$osversion = $env:OS >> survey.txt
$allprocess = tasklist | Sort-Object -Property session >> survey.txt
$sockets = NETSTAT.EXE >> survey.txt

}


#this function read the hash of the file provided and print it out to hashdir.txt

function hash-file
     { 
param ( 
 [Parameter( Mandatory=$true)] $directory
 
)

$hashAlgorithm =  Get-FileHash  $directory -Algorithm SHA256

    
    ForEach($file in Get-ChildItem | Format-List -Property mode) { 
       
        
            $hashAlgorithm > hashdir.txt
        
        }

}

#this function provide the user with his ipv4 address 

function get-mycustom {
    
 $userip = Test-Connection -ComputerName (hostname) -Count 1  | Select IPV4Address

  echo "this your $userip"

                        }

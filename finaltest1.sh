#!/bin/bash
#this scripts works on CentOS
#hello im mohammed
main(){

print_header() {	#print out a line to show what is being used
  echo -e "\n#===========\t$1\t===========#\n"
	  
     }
ip_checker(){		
print_header host  
if ping -c1 $1 &> /dev/null 
then
  echo $1 is up #prints out when the ip is up
else
  echo $1 is down
fi
	}
Selinux(){

selPolicy=$( getenforce )
print_header SeLpolicy
while [[ '$selPolicy' != "Enforcing" ]];do
echo "change the policy to 'Enforcing'" 
break
done
}

trace_check() {
  print_header traceroute
  
  traceroute $1
 
}

Selinux
ip_checker $@
trace_check $@

}
main $@  	#calling main and passing the CLI arguments

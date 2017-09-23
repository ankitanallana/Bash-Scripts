#!/bin/bash

orgname="$1"
filename="$2"

exec 3< $filename

while [[ ! $orgname ]]
do
	read -p "Please enter an organisation under your organisation " orgname
done

while [[ ! $filename ]]
do
	read -p "Please enter a filename to read the list of repos from " filename
done


echo $orgname
input_flag=""
if [[ $filename ]]
then
	read -p "Press i to enter into interactive mode or any key to delete all repos in $filename : " input_flag
fi


if [ "$input_flag" == "i" ]
	then
	
	while IFS= read -u 3 -r repo 
	do
		read -p "Do you want to delete repo $repo? Enter y/n : " ip 
  		if [ "$ip" == "y" ]
  			then
  			curl -i -X DELETE -H 'Authorization: token {token}' 'https://{hostname}/api/v3/repos/'$orgname'/'$repo
  		fi
   
	done 

else
	echo "Deleting all repos in "$filename
	while IFS= read -r repo
	do
  		curl -i -X DELETE -H 'Authorization: token {token}' 'https://{hostname}/api/v3/repos/'$orgname'/'$repo
   
	done < "$filename"

fi

echo "End of script"
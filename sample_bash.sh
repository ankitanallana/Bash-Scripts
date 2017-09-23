#!/bin/bash

echo Will now create repos within organization

echo Creating repos section 1

name="student-10"

for i in {1..9}
do
	repo_name=$name$i
	#echo $repo_name
	curl -i -H 'Authorization: token <token>' -d '{"name": "'"$repo_name"'","auto_init": true,"private": true}' "https://hostname/api/v3/orgs/{org-name}/repos" >> output_log.txt
	echo created $repo_name
done

name="student-1"

for i in {10..60}
do
	repo_name=$name$i
	#echo $repo_name
	curl -i -H 'Authorization: token <token>' -d '{"name": "'"$repo_name"'","auto_init": true,"private": true}' "https://hostname/api/v3/orgs/{org-name}/repos" >> output_log.txt
	echo created $repo_name
done

echo Creating repos section 2

name="student-20"

for i in {1..9}
do
	repo_name=$name$i
	#echo $repo_name
	curl -i -H 'Authorization: token <token>' -d '{"name": "'"$repo_name"'","auto_init": true,"private": true}' "https://hostname/api/v3/orgs/{org-name}/repos" >> output_log.txt
	echo created $repo_name
done

name="student-2"

for i in {10..60}
do
	repo_name=$name$i
	#echo $repo_name
	curl -i -H 'Authorization: token <token>' -d '{"name": "'"$repo_name"'","auto_init": true,"private": true}' "https://hostname/api/v3/orgs/{org-name}/repos" >> output_log.txt
	echo created $repo_name
done


echo End of program Please check log

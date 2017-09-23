#!/bin/bash

#Outer loop for 4 pages of results (we have 120 repos)

for count in {1..4}
do
	echo PAGE $count

	for i in {0..29}
	do
		#retrieve all repos by page. By default, 30 results are returned PER PAGE
		clone_url=$(curl -H 'Authorization: token <token>' https://hostname/api/v3/orgs/{org-name}/repos?page=$count | jq ".[$i]" | jq '.clone_url')
		repo_name=$(curl -H 'Authorization: token <token>' https://hostname/api/v3/orgs/{org-name}/repos?page=$count | jq ".[$i]" | jq '.name')
		
		#remove quotes from both strings
		repo_name=${repo_name#\"}
		repo_name=${repo_name%\"}
		echo REPO $repo_name

		clone_url=${clone_url#\"}
		clone_url=${clone_url%\"}
		echo CLONE URL $clone_url

		#pick a location of your choice
		cd /
		cd Users/{YourName}/Desktop

		mkdir MSD_Fall2017
		cd MSD_Fall2017/

		#clone the repository to your local 
		git clone $clone_url
		echo CLONED $repo_name

		#create directories inside repos
		cd $repo_name
		mkdir HW1
		echo "Place Homework 1 in this directory" > hw1/readme.txt
		mkdir HW2
		echo "Place Homework 2 in this directory" > hw2/readme.txt
		mkdir HW3
		echo "Place Homework 3 in this directory" > hw3/readme.txt
		mkdir HW4
		echo "Place Homework 4 in this directory" > hw4/readme.txt
		mkdir HW5
		echo "Place Homework 5 in this directory" > hw5/readme.txt
		git add -A
		git commit -m "Created directories for Homeworks"
		git push
done
done

#end


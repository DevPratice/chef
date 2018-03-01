#!/bin/bash

for cookbook in `ls /home/ec2-user/chef-repo/cookbooks`; do 
    cd /home/ec2-user/chef-repo/cookbooks
    knife cookbook upload $cookbook &>/dev/null
    if [ $? -eq 0 ]; then 
        echo "Cookbook $cookbook Upload -- SUCCESS"
    else
        echo "Cookbook $cookbook Upload -- FAILURE"
        exit 1
    fi
done

ssh -i ~/devops.pem -l ec2-user $1 'sudo chef-client'

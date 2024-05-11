#!/bin/bash
# $1 = configuration from user
# $2 = PREFIX_PATH from Dockerfile

mkdir -p $2/config

if [[ $# -eq 1 ]]; then
    echo "No config files will be copied"
    exit 0
elif [[ $1 == "all" ]]; then
    echo "All config files will be copied"
    cp ./config_files/* "$2/config/"
else
    for fileName in $1; do
        targetFile="./config_files/$fileName.config"
        
        if [ -f "$targetFile" ]; then
            echo "Copying $targetFile"
            cp "$targetFile" "$2/config/"
        else
            echo "Skipping $targetFile as it does not exist"
        fi
    done
fi

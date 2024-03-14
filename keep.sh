#!/bin/bash

# Get the current date and time
date=$(date +"%Y-%m-%d_%H_%M_%S")

# Define the name of the zip file
zipFileName="${date}.zip"

# Get the current directory
currentDirectory=$(pwd)

# Get the parent directory
parentDirectory=$(dirname "$currentDirectory")

# Define the backup directory
backupDirectory="${parentDirectory}/backups"

# Create the backup directory if it doesn't exist
if [ ! -d "$backupDirectory" ]; then
  mkdir -p "$backupDirectory"
fi

# Define the full path for the zip file
zipFilePath="${backupDirectory}/${zipFileName}"

# Create the zip file
zip -r "$zipFilePath" "$currentDirectory"

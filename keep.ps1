# Get the current date and time
$date = Get-Date -Format "yyyy-MM-dd_HH_mm_ss"

# Define the name of the zip file
$zipFileName = "$date.zip"

# Get the current directory
$currentDirectory = Get-Location

# Get the parent directory
$parentDirectory = Split-Path -Parent $currentDirectory

# Define the backup directory
$backupDirectory = Join-Path -Path $parentDirectory -ChildPath "backups"

# Create the backup directory if it doesn't exist
if (!(Test-Path -Path $backupDirectory)) {
  New-Item -ItemType Directory -Path $backupDirectory | Out-Null
}

# Define the full path for the zip file
$zipFilePath = Join-Path -Path $backupDirectory -ChildPath $zipFileName

# Create the zip file
Compress-Archive -Path $currentDirectory -DestinationPath $zipFilePath
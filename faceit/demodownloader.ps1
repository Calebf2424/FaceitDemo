# Check if the user provided a file name as an argument
if ($args.Count -eq 0) {
    Write-Host "Usage: .\ExtractWithWinRAR.ps1 <filename>"
    Write-Host "Example: .\ExtractWithWinRAR.ps1 custom_map.zip"
    exit
}

# Get the file name from the command-line argument
$fileName = $args[0]

# Define paths
$sourceFolder = "C:\Users\<USERNAME>\Downloads"  # Placeholder for user profile
$destinationFolder = "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo"
$winRARPath = "<WINRAR_PATH>"  # Placeholder for WinRAR path

# Ensure the destination folder exists
if (-not (Test-Path -Path $destinationFolder)) {
    Write-Host "Error: Destination folder '$destinationFolder' does not exist."
    exit 1
}

# Construct full path to the zip file
$zipFilePath = Join-Path -Path $sourceFolder -ChildPath $fileName

# Check if the file exists and extract
if (Test-Path -Path $zipFilePath) {
    try {
        $command = "& `"$winRARPath`" x -o+ `"$zipFilePath`" `"$destinationFolder`""
        Invoke-Expression $command
        Write-Host "File '$fileName' extracted successfully to '$destinationFolder'."
    } catch {
        Write-Host "Error: Failed to extract the file. Please ensure WinRAR is installed and the file is valid."
        exit 1
    }
} else {
    Write-Host "Error: File '$fileName' not found in '$sourceFolder'."
    exit 1
}

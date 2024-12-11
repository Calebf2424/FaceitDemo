# Prompt user for their username
$username = Read-Host "Enter your Windows username"

# Prompt user for the WinRAR installation path
$winRARPath = Read-Host "Enter the full path to WinRAR's Rar.exe (e.g., C:\Program Files\WinRAR\Rar.exe)"

# Validate inputs
if (-not (Test-Path -Path $winRARPath)) {
    Write-Host "Error: The specified WinRAR path does not exist."
    exit 1
}

# Read the template script
$templateFile = "demodownloader.ps1"
$outputFile = "ExtractWithWinRAR.ps1"

if (-not (Test-Path -Path $templateFile)) {
    Write-Host "Error: Template file 'demodownloader.ps1' not found."
    exit 1
}

$templateContent = Get-Content -Path $templateFile

# Replace placeholders
$templateContent = $templateContent -replace "<USERNAME>", $username
$templateContent = $templateContent -replace "<WINRAR_PATH>", [Regex]::Escape($winRARPath)

# Save the modified script
$templateContent | Set-Content -Path $outputFile

Write-Host "Setup complete. The script has been configured and saved as '$outputFile'."

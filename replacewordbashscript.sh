# Function to run the fifth script
function Run-Script5 {
    Clear-Host
    Write-Host "Running the fifth script..."
    Start-Sleep -Seconds 2
    Clear-Host

    # Define the directory to search in
    $searchDirectory = "C:\Users\Chaos\OneDrive\Documents\GitHub\server_logs"

    # Define the word to search for
    $searchWord = "YourOLDMOD"

    # Define the new word to replace the found word with
    $replaceWord = "YourNEWMOD"

    # Recursively find all files in the directory and its subdirectories
    Get-ChildItem -Path $searchDirectory -Recurse -Include *.xml,*.c | ForEach-Object {
        # Read the file line by line
        $content = Get-Content $_.FullName

        # Replace the found word with the new word
        $newContent = $content -replace [regex]::Escape($searchWord), $replaceWord

        # Write the new content back to the file
        Set-Content -Path $_.FullName -Value $newContent
    }

    Write-Host "Replacement completed."

    Start-Sleep -Seconds 2
    Clear-Host
}

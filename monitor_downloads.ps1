# Define the folder to monitor and the Python script to run
$folderToMonitor = "$env:USERPROFILE\Downloads"
$pythonScript = ""
$pythonExecutable = "" # Adjust the path to your Python executable

# Create a FileSystemWatcher
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $folderToMonitor
$watcher.Filter = "*.*"
$watcher.IncludeSubdirectories = $false
$watcher.EnableRaisingEvents = $true

# Define the action to take on file system changes
$action = {
    param($source, $eventArgs)

    Start-Sleep -Seconds 1  # Wait to ensure file is finalized

    # Skip temporary files
    if ($eventArgs.FullPath -like "*.tmp") {
        Write-Host "Skipping temporary file: $($eventArgs.FullPath)"
        return
    }

    Write-Host "Change detected: $($eventArgs.FullPath)"
    Start-Process -FilePath $pythonExecutable -ArgumentList $pythonScript -NoNewWindow
}

# Register the event handlers
Register-ObjectEvent -InputObject $watcher -EventName "Created" -Action $action
Register-ObjectEvent -InputObject $watcher -EventName "Changed" -Action $action
Register-ObjectEvent -InputObject $watcher -EventName "Deleted" -Action $action

# Keep the script running
Write-Host "Monitoring $folderToMonitor. Press Ctrl+C to stop."
while ($true) { Start-Sleep -Seconds 1 }

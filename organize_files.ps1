param([string]$FolderPath = (Read-Host -Prompt "Enter folder path"))

Get-ChildItem -Path $FolderPath -Recurse -File | ForEach-Object {
    $destinationFolder = Join-Path -Path $FolderPath -ChildPath $_.Extension.TrimStart(".")
    if (-not (Test-Path -Path $destinationFolder)) {
        New-Item -Path $destinationFolder -ItemType Directory
    }
    Move-Item -Path $_.FullName -Destination $destinationFolder
}
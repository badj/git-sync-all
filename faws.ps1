$parentDir = Get-Location

Get-ChildItem -Directory | ForEach-Object {
    $gitPath = Join-Path $_.FullName ".git"
    if (Test-Path $gitPath) {
        Write-Host "--------------------------------------------" -ForegroundColor Cyan
        Write-Host "Updating: $($_.Name)" -ForegroundColor Yellow

        Set-Location $_.FullName

        # 1. Fetch from all remotes
        git fetch --all

        # 2. Check for local changes and stash them
        $stashOutput = git stash
        $hasStashed = $stashOutput -notmatch "No local changes to save"

        if ($hasStashed) {
            Write-Host "Local changes detected: Stashed safely." -ForegroundColor Magenta
        }

        # 3. Pull latest changes
        git pull

        # 4. Pop the stash if we created one
        if ($hasStashed) {
            Write-Host "Re-applying your local changes..." -ForegroundColor Magenta
            git stash pop
        }

        Set-Location $parentDir
    }
}

Write-Host "--------------------------------------------" -ForegroundColor Cyan
Write-Host "All repositories processed!" -ForegroundColor Green

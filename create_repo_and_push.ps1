param(
    [string]$RepoName = "KruskalProlog",
    [string]$GitHubUser = "hussein-alali-alismael",
    [ValidateSet('Public','Private')][string]$Visibility = 'Public'
)

# Initialize git repo
git init
git add .
git commit -m "Initial commit: Kruskal Prolog implementation"

# Prefer gh CLI if available
if (Get-Command gh -ErrorAction SilentlyContinue) {
    gh repo create "$GitHubUser/$RepoName" --$Visibility --source . --remote origin --push
} else {
    Write-Host "gh CLI not found. Please create an empty repo on GitHub named $RepoName and then run the following commands:" -ForegroundColor Yellow
    Write-Host "git branch -M main"
    Write-Host "git remote add origin https://github.com/$GitHubUser/$RepoName.git"
    Write-Host "git push -u origin main"
}

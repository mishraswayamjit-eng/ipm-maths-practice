# Optional helper: run from inside this folder in PowerShell.
#   .\deploy.ps1 -RepoName ipm-maths-practice
# Needs: Git. Optional: GitHub CLI (gh) and Vercel CLI (vercel).
param(
  [string]$RepoName = "ipm-maths-practice",
  [ValidateSet("public","private")][string]$Visibility = "public"
)

$ErrorActionPreference = "Stop"

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
  Write-Host "Git is not installed. Install it from https://git-scm.com/download/win and re-run." -ForegroundColor Red
  exit 1
}

if (-not (Test-Path ".git")) {
  git init -b main
}
git add .
git commit -m "IPM Std V maths practice app" 2>$null

if (Get-Command gh -ErrorAction SilentlyContinue) {
  gh auth status 2>$null
  if ($LASTEXITCODE -ne 0) { gh auth login }
  gh repo create $RepoName --$Visibility --source . --remote origin --push
  Write-Host "Pushed to GitHub: $RepoName" -ForegroundColor Green
} else {
  Write-Host "GitHub CLI (gh) not found." -ForegroundColor Yellow
  Write-Host "Create an empty repo at https://github.com/new, then run:"
  Write-Host "  git remote add origin https://github.com/<your-username>/$RepoName.git"
  Write-Host "  git push -u origin main"
}

if (Get-Command vercel -ErrorAction SilentlyContinue) {
  Write-Host "Deploying to Vercel..." -ForegroundColor Cyan
  vercel --prod
} else {
  Write-Host "Vercel CLI not found. Use the dashboard steps in README.md, or run: npm i -g vercel" -ForegroundColor Yellow
}

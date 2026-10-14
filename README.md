# IPM Std V Maths Scholarship Practice

A single-page practice app for Std V (Grade 5) with **400 past-paper questions (2016 to 2025)**,
organised by textbook chapter and by year. Every question has the printed options, a hint after a
wrong answer, and a solved solution with the formula or strategy.

It is a plain static site: `index.html` only. No build step, no dependencies.
(It loads two Google Fonts and falls back to system fonts if offline.)

Progress and stars are saved in the browser (localStorage) on each device.

---

## 1. Put it on GitHub (PowerShell)

Open PowerShell, unzip the folder, then:

```powershell
cd path\to\ipm-maths-practice

git init -b main
git add .
git commit -m "IPM Std V maths practice app"
```

**Option A: GitHub CLI (easiest)**

```powershell
winget install GitHub.cli        # one time, then reopen PowerShell
gh auth login                    # one time
gh repo create ipm-maths-practice --public --source . --remote origin --push
```

**Option B: create the repo in the browser**

1. Go to https://github.com/new, name it `ipm-maths-practice`, leave it empty (no README), create.
2. Back in PowerShell:

```powershell
git remote add origin https://github.com/<your-username>/ipm-maths-practice.git
git push -u origin main
```

> First time with Git? Set your identity once:
> `git config --global user.name "Your Name"` and `git config --global user.email "you@example.com"`

You can also just run `.\deploy.ps1` from this folder. It does the Git steps, uses `gh` if installed,
and deploys with Vercel if the Vercel CLI is installed. If PowerShell blocks scripts, run
`Set-ExecutionPolicy -Scope Process Bypass` first.

---

## 2. Make it live on Vercel

**Option A: Dashboard (recommended, auto-deploys on every push)**

1. Sign in at https://vercel.com with GitHub.
2. **Add New... > Project**, pick the `ipm-maths-practice` repo, **Import**.
3. Framework Preset: **Other**. Leave Build Command and Output Directory empty.
4. **Deploy**. You get a link like `https://ipm-maths-practice.vercel.app`.

**Option B: Vercel CLI from PowerShell**

```powershell
npm i -g vercel        # needs Node.js from https://nodejs.org
vercel login
vercel                 # preview deploy, accept the defaults
vercel --prod          # production deploy
```

---

## 3. Updating later

Edit `index.html`, then:

```powershell
git add .
git commit -m "Update"
git push
```

Vercel redeploys automatically (Option A).

## Files

| File | Purpose |
|---|---|
| `index.html` | The whole app |
| `vercel.json` | Clean URLs and basic security headers |
| `.gitignore` | Keeps local Vercel/Node files out of Git |
| `deploy.ps1` | Optional PowerShell helper |
| `README.md` | These instructions |

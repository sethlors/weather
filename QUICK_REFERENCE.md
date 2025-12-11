# Quick Reference Guide

## 🚀 Quick Start

### View Your Weather Station
- **Live Site**: https://sethlors.github.io/weather/
- **Main Page**: index.html
- **Wide View**: BasicW.htm
- **Standard View**: Basic.htm  
- **Mobile View**: BasicS.htm

### File Types Explained
- **`.htx` files** = Templates with placeholders like `<!--outsideTemp-->`
- **`.htm` files** = Generated HTML with real weather data (GitHub Pages serves these)
- **`.gif` files** = Weather graphs and indicators

## 🔧 Common Tasks

### Test Locally on Mac
```bash
cd /Users/sethlors/Developer/weather
open index.html
```

### Commit and Push Changes
```bash
git add .
git commit -m "Update weather templates"
git push origin main
```

### Check What Changed
```bash
git status
git diff
```

### View Recent Commits
```bash
git log --oneline -5
```

## 📁 Important Directories

- `/` (root) - Main HTML files and templates
- `/Daily/` - Daily weather images (WindDirection.gif, etc.)
- Root also has individual weather graphs (*.gif files)

## 🔄 Update Flow

1. **Windows PC** generates .htm files from .htx templates
2. **Windows PC** pushes .htm and .gif files to GitHub (every 5 min)
3. **GitHub Pages** automatically updates live site
4. **Visitors** see updated weather data

## 🛠️ Troubleshooting

### Images not showing?
- Check file paths in .htm files match actual locations
- Verify Daily/ directory exists
- Make sure .gif files are being pushed

### Data not updating?
- Check Windows Task Scheduler is running
- Verify weather software is generating files
- Look at Git commit history on GitHub

### GitHub Pages not working?
- Enable in Settings → Pages
- Select main branch, root folder
- Wait 1-2 minutes after enabling

## 📝 Customization

### Change refresh rate
Edit meta tag in .htx files:
```html
<meta http-equiv="refresh" content="300">
```
(300 = 5 minutes in seconds)

### Modify layout
Edit the .htx template files, not the .htm files!
Your weather software will regenerate .htm from .htx

## 🪟 Windows Setup Summary

1. Install Git for Windows
2. Clone repository
3. Configure weather software to export to repo directory  
4. Set up Task Scheduler to run `push-weather-data.bat` every 5 min
5. See WINDOWS_SETUP.md for detailed instructions

## 🔗 Important Links

- GitHub Repo: https://github.com/sethlors/weather
- Live Site: https://sethlors.github.io/weather/
- GitHub Pages Docs: https://docs.github.com/en/pages

## 📞 Support Files

- `README.md` - Full documentation
- `WINDOWS_SETUP.md` - Windows configuration guide
- `push-weather-data.bat` - Automated push script
- `.gitignore` - Files to exclude from Git

---
Last Updated: December 2025

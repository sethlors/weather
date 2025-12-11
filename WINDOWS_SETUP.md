# Windows Setup Guide for Automated Weather Data Updates

## Prerequisites

1. **Git for Windows** installed ([download here](https://git-scm.com/download/win))
2. **Davis Weather Station software** configured and running
3. **GitHub account** with the weather repository created

## Step-by-Step Setup

### 1. Install Git for Windows

1. Download Git from https://git-scm.com/download/win
2. Run the installer with default settings
3. During installation, select:
   - ✅ "Git from the command line and also from 3rd-party software"
   - ✅ "Use Git Credential Manager"

### 2. Configure Git Credentials

Open **Command Prompt** or **PowerShell** and run:

```batch
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"
```

### 3. Set Up GitHub Authentication

#### Option A: HTTPS with Personal Access Token (Recommended)

1. Go to GitHub.com → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Click "Generate new token (classic)"
3. Give it a name like "Weather Station"
4. Select scopes:
   - ✅ `repo` (Full control of private repositories)
5. Click "Generate token"
6. **SAVE THE TOKEN** - you'll need it when you first push

#### Option B: SSH Keys

1. Generate SSH key:
   ```batch
   ssh-keygen -t ed25519 -C "your-email@example.com"
   ```
2. Add to GitHub: Settings → SSH and GPG keys → New SSH key
3. Paste the contents of `C:\Users\YourName\.ssh\id_ed25519.pub`

### 4. Clone Your Repository

1. Open Command Prompt
2. Navigate to where you want to store the local copy:
   ```batch
   cd C:\WeatherLink
   ```
3. Clone your repository:
   ```batch
   git clone https://github.com/sethlors/weather.git
   ```
   Or with SSH:
   ```batch
   git clone git@github.com:sethlors/weather.git
   ```

### 5. Configure Weather Software

Configure your Davis Weather Station software to:

1. **Export Location**: Set export path to `C:\WeatherLink\weather\`
2. **Template Files**: Place your `.htx` template files in this directory
3. **Output Format**: Ensure it generates:
   - `.htm` files from templates
   - `.gif` image files
   - Updates to `Daily/` subdirectory if needed

### 6. Set Up the Push Script

1. Copy `push-weather-data.bat` to `C:\WeatherLink\weather\`
2. Edit the file and update the path on line 10:
   ```batch
   cd /d "C:\WeatherLink\weather"
   ```
3. Test the script by double-clicking it

### 7. Schedule Automatic Updates

1. Open **Task Scheduler**:
   - Press `Win + R`
   - Type `taskschd.msc`
   - Press Enter

2. Click **"Create Task"** (not "Create Basic Task")

3. **General Tab**:
   - Name: `Weather Station Push`
   - Description: `Automatically push weather data to GitHub`
   - ✅ Run whether user is logged on or not
   - ✅ Run with highest privileges
   - Configure for: Windows 10/11

4. **Triggers Tab**:
   - Click **"New..."**
   - Begin the task: **On a schedule**
   - Settings: **Daily**
   - ✅ Repeat task every: **5 minutes**
   - For a duration of: **Indefinitely**
   - ✅ Enabled
   - Click **OK**

5. **Actions Tab**:
   - Click **"New..."**
   - Action: **Start a program**
   - Program/script: `C:\WeatherLink\weather\push-weather-data.bat`
   - Start in: `C:\WeatherLink\weather`
   - Click **OK**

6. **Conditions Tab**:
   - ❌ Start the task only if the computer is on AC power (uncheck this)
   - ❌ Stop if the computer switches to battery power (uncheck this)

7. **Settings Tab**:
   - ✅ Allow task to be run on demand
   - ✅ Run task as soon as possible after a scheduled start is missed
   - ✅ If the task fails, restart every: **1 minute**
   - Attempt to restart up to: **3 times**

8. Click **OK** to save

9. You may be prompted to enter your Windows password

### 8. Test the Setup

1. Make a small change to one of your `.htm` files
2. In Task Scheduler, right-click your task → **Run**
3. Check the "Last Run Result" column - it should show **"The operation completed successfully. (0x0)"**
4. Visit GitHub.com and verify the commit appears
5. Wait 1-2 minutes, then check your GitHub Pages site

## Troubleshooting

### "Permission denied" or "Authentication failed"

**Solution**: Configure Git credentials

```batch
git config --global credential.helper manager-core
```

Then try pushing manually once:
```batch
cd C:\WeatherLink\weather
git push
```

Enter your GitHub username and Personal Access Token when prompted.

### Task Scheduler shows "The operator or administrator has refused the request (0x800710E0)"

**Solution**: The task is set to run only when logged in

1. Edit the task
2. On General tab, select "Run whether user is logged on or not"
3. Click OK and enter your Windows password

### Images not appearing on website

**Solution**: Check file paths

1. Verify images are in the correct directories
2. Check that `Daily/` folder exists
3. Update paths in `.htx` templates if needed

### Git says "nothing to commit"

This is normal if your weather software hasn't generated new data since the last push.

### Changes not appearing on GitHub Pages

1. Check that the push was successful in Task Scheduler
2. Wait 1-2 minutes for GitHub Pages to rebuild
3. Hard refresh your browser (Ctrl + F5)
4. Check GitHub Actions tab for build errors

## Monitoring

### View Recent Commits
```batch
cd C:\WeatherLink\weather
git log --oneline -10
```

### Check Git Status
```batch
cd C:\WeatherLink\weather
git status
```

### View Task Scheduler History

1. Open Task Scheduler
2. Find your task
3. Click the "History" tab at the bottom
4. Review recent executions

## Optional Enhancements

### Add Logging

Modify the batch file to save logs:

```batch
echo Weather update: %date% %time% >> C:\WeatherLink\logs\push-log.txt
```

### Email Notifications on Failure

Set up Task Scheduler to send an email if the task fails:
1. Task Properties → Actions → Add another action
2. Choose "Send an e-mail"
3. Configure SMTP settings

### Backup Weather Data

Add to your batch script:
```batch
REM Create daily backup
xcopy C:\WeatherLink\weather\*.htm C:\WeatherLink\Backups\%date:~-4,4%%date:~-10,2%%date:~-7,2%\ /Y
```

## Security Checklist

- ✅ Use Personal Access Token, not your GitHub password
- ✅ Never commit tokens or passwords to the repository
- ✅ Enable 2FA on your GitHub account
- ✅ Use a dedicated token with minimal permissions (only `repo`)
- ✅ Keep your Windows system updated
- ✅ Use Windows Firewall to protect your system

## Support

If you encounter issues:
1. Check Task Scheduler history for error codes
2. Run the batch script manually to see error messages
3. Verify your Git credentials are working
4. Check GitHub status at https://www.githubstatus.com/

---

**Last Updated**: December 2025

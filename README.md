# 🌤️ Weather Station - Live Data Display

A real-time weather station data display system using GitHub Pages. This repository automatically receives weather data updates from a Davis Weather Station and displays them on a live website.

## 🚀 Live Website

Visit your weather station at: **https://sethlors.github.io/weather/**

## 📋 Overview

This weather station system consists of:
- **HTML Templates** (`.htx` files) - Template files with placeholders for weather data
- **Generated HTML** (`.htm` files) - Rendered pages with actual weather data
- **Weather Images** (`.gif` files) - Dynamically generated weather graphs and indicators
- **GitHub Pages** - Hosting the live website

## 🔧 How It Works

### Data Flow

1. **Weather Station** → Your Davis Weather Station collects real-time weather data
2. **Windows PC** → Weather software processes data and:
   - Fills in `.htx` template files with current data
   - Generates `.htm` files with live weather information
   - Creates/updates `.gif` image files (graphs, wind direction, etc.)
3. **GitHub Push** → Automated script pushes updates to GitHub every 5 minutes
4. **GitHub Pages** → Automatically serves the updated content to visitors

### File Structure

```
weather/
├── index.html              # Main landing page (auto-generated)
├── BasicW.htm/htx         # Wide view - optimized for desktops
├── Basic.htm/htx          # Standard view - detailed metrics
├── BasicS.htm/htx         # Compact view - mobile-friendly
├── Detail.htm/htx         # Detailed weather report
├── Detail-All.htm/htx     # Complete data view
├── History_*.htm          # Historical data views
├── Daily/                 # Directory for daily weather images
│   └── WindDirection.gif  # Wind direction indicator
├── *.gif                  # Weather graphs and charts
└── README.md              # This file
```

## 🛠️ Setup Instructions

### 1. GitHub Pages Setup

1. Go to your repository settings on GitHub
2. Navigate to **Settings** → **Pages**
3. Under **Source**, select:
   - Branch: `main`
   - Folder: `/ (root)`
4. Click **Save**
5. Your site will be live at: `https://sethlors.github.io/weather/`

### 2. Windows PC Configuration

On your Windows PC running the weather station software:

#### A. Ensure Your Weather Software Generates Files

Make sure your Davis Weather Station software is configured to:
- Generate `.htm` files from `.htx` templates
- Update `.gif` image files
- Save all files to a local directory

#### B. Set Up Git for Automatic Pushes

Create a batch file (e.g., `push-weather-data.bat`) in your weather data directory:

```batch
@echo off
cd /d "C:\Path\To\Your\Weather\Data"

REM Add all changes
git add *.htm *.gif Daily/*.gif

REM Commit with timestamp
git commit -m "Weather update %date% %time%"

REM Push to GitHub
git push origin main

echo Weather data pushed to GitHub at %time%
```

#### C. Schedule Automatic Updates

1. Open **Task Scheduler** on Windows
2. Create a new task:
   - **Trigger**: Every 5 minutes (or your preferred interval)
   - **Action**: Run your `push-weather-data.bat` script
   - **Settings**: Enable "Run whether user is logged on or not"

### 3. Directory Organization

Make sure the following directories exist:
- `/Daily/` - For daily weather images referenced in templates

If your weather software generates images in different locations, either:
- **Option A**: Update the image paths in your `.htx` templates
- **Option B**: Configure your software to save images to the correct directories

## 📱 Available Views

### Main Views
- **Wide View** (`BasicW.htm`) - Full desktop display with all metrics
- **Standard View** (`Basic.htm`) - Comprehensive data display
- **Compact View** (`BasicS.htm`) - Mobile-optimized, essential data only

### Advanced Views
- **Detail** (`Detail.htm`) - Extended weather report
- **Detail-All** (`Detail-All.htm`) - Complete data view with all available metrics
- **History** (`History_Vantage_Pro.htm`) - Historical weather data and trends

## 🎨 Features

✅ **Auto-refresh** - Pages refresh every 5 minutes to show latest data  
✅ **Mobile responsive** - Multiple view options for different screen sizes  
✅ **Live graphs** - Dynamic weather charts and visualizations  
✅ **Real-time updates** - Data syncs automatically from your weather station  
✅ **Historical data** - Track weather trends over time  

## 📊 Weather Data Displayed

- 🌡️ **Temperature** - Current, high, low, trends
- 💨 **Wind** - Speed, direction, gusts
- 💧 **Humidity** - Indoor and outdoor readings
- 🌧️ **Rainfall** - Current rate, storm total, monthly, yearly
- 📊 **Barometer** - Pressure and trends
- ❄️ **Wind Chill** - Calculated wind chill factor
- 🔥 **Heat Index** - Apparent temperature
- 📈 **Historical Charts** - Graphs for all metrics

## 🔄 Update Frequency

- **Weather Station**: Updates every 1-5 minutes (depends on your hardware)
- **GitHub Push**: Every 5 minutes via automated script
- **Page Refresh**: Auto-refreshes every 5 minutes for visitors

## 🐛 Troubleshooting

### Images Not Displaying
- Check that image files are being pushed to GitHub
- Verify file paths in `.htm` files match actual file locations
- Ensure `Daily/` directory exists and contains images

### Data Not Updating
- Verify your Windows scheduled task is running
- Check that weather software is generating `.htm` files
- Ensure Git credentials are configured on Windows PC
- Review Git push logs for errors

### GitHub Pages Not Working
- Confirm GitHub Pages is enabled in repository settings
- Check that `index.html` exists in root directory
- Wait 1-2 minutes after pushing for changes to appear

## 📝 Customization

### Modify Display Templates
Edit the `.htx` template files to customize:
- Layout and styling
- Which weather metrics to display
- Update intervals
- Color schemes

**Note**: Changes to `.htx` files won't appear until your weather software regenerates the `.htm` files.

### Change Update Frequency
- In `.htx` files: Modify `<meta http-equiv="refresh" content="300">` (time in seconds)
- In Task Scheduler: Adjust the trigger interval

## 🔒 Security Notes

- Never commit passwords or API keys to the repository
- Use Git credential manager on Windows for secure authentication
- Consider using SSH keys instead of HTTPS for GitHub authentication
- The `.gitignore` file excludes sensitive files like `__IPaddress.txt`

## 📚 Resources

- [Davis Weather Stations](https://www.davisinstruments.com/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [Git for Windows](https://git-scm.com/download/win)

## 📄 License

This project is for personal use. Weather data is specific to your location and station.

---

**Last Updated**: December 2025  
**Station Type**: Davis Vantage Pro  
**Powered by**: GitHub Pages
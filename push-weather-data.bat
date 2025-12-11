@echo off
REM ============================================================
REM Weather Station Data Push Script
REM ============================================================
REM This script automatically commits and pushes weather data
REM updates to GitHub. Run this with Windows Task Scheduler.
REM ============================================================

REM Change to your weather data directory
REM UPDATE THIS PATH TO YOUR ACTUAL WEATHER DATA DIRECTORY!
cd /d "C:\WeatherLink\Export"

REM Optional: Print current time for logging
echo ================================================
echo Weather Data Update: %date% %time%
echo ================================================

REM Add all HTML files (generated from .htx templates)
git add *.htm

REM Add all GIF images (weather graphs and indicators)
git add *.gif

REM Add images in Daily subdirectory (if it exists)
git add Daily/*.gif 2>nul

REM Commit changes with timestamp
git commit -m "Weather update: %date% %time%"

REM Check if there were changes to commit
if %ERRORLEVEL% EQU 0 (
    echo Changes detected, pushing to GitHub...
    
    REM Push to GitHub
    git push origin main
    
    if %ERRORLEVEL% EQU 0 (
        echo Successfully pushed to GitHub!
    ) else (
        echo ERROR: Failed to push to GitHub
        echo Check your internet connection and Git credentials
    )
) else (
    echo No changes to commit
)

echo ================================================
echo Update completed at %time%
echo ================================================

REM Optional: Keep window open for debugging (comment out for Task Scheduler)
REM pause

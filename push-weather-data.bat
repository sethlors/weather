@echo off
REM ============================================================
REM Weather Station Data Push Script
REM ============================================================
REM This script automatically commits and pushes weather data
REM updates to GitHub. Run this with Windows Task Scheduler.
REM ============================================================

REM Change to your GitHub repository directory
cd /d "D:\Users\Ginny\Documents\GitHub\Davis_Weather"

REM Optional: Print current time for logging
echo ================================================
echo Weather Data Update: %date% %time%
echo ================================================

REM Add all files in the directory
git add *

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

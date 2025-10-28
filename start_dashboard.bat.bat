@echo off
echo ========================================
echo    Mikrotik Hotspot Management System
echo ========================================
echo.

REM Change to the dashboard directory
cd /d "%~dp0"

REM Check if virtual environment exists
if not exist "venv\Scripts\activate.bat" (
    echo Creating virtual environment...
    python -m venv venv
    echo.
)

REM Activate virtual environment
echo Activating virtual environment...
call venv\Scripts\activate.bat

REM Install/update requirements
echo Installing required packages...
pip install -r requirements.txt --quiet

REM Start the application
echo.
echo Starting Mikrotik Dashboard...
echo Dashboard will be available at: http://localhost:5000
echo Press Ctrl+C to stop the server
echo.

python app.py

echo.
echo Dashboard stopped. Press any key to exit...
pause >nul
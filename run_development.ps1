# ================================================================================
# PowerShell-Skript zum Einrichten der Entwicklungsumgebung für ein Django-Projekt
# Author: Sascha Magiera
# Date: 2026-05-02
# Version: 1.0.0
# https://www.youtube.com/watch?v=LVlmSYiUjko
# 
# Beschreibung:
#   Dieses Skript wechselt in das Verzeichnis src/django, aktiviert die virtuelle Umgebung,
#   installiert die Abhängigkeiten, führt Datenbankmigrationen durch, sammelt statische Dateien
#   und startet den Entwicklungsserver.
# ================================================================================


# Wechselt relativ vom aktuellen Speicherort
Write-Host "Setting up development environment..." -ForegroundColor Cyan
if (Test-Path -Path "src/django") {
    Write-Host "Changing directory to src/django..." -ForegroundColor Cyan
    Set-Location -Path "src/django"
}else {
    Write-Host "Directory src/django does not exist. Staying in current directory." -ForegroundColor Yellow
}
Write-Host "Current directory: $(Get-Location)" -ForegroundColor Green

Write-Host "Activating virtual environment..." -ForegroundColor Cyan
if (Test-Path -Path ".\.env\Scripts\Activate.ps1") {
    .\.env\Scripts\Activate.ps1
}else {
    Write-Host "Virtual environment activation script not found. Please ensure the virtual environment is set up correctly." -ForegroundColor Red
    exit 1
}
Write-Host "Upgrading pip..." -ForegroundColor Cyan
python -m pip install --upgrade pip
Write-Host "Installing dependencies from requirements.txt..." -ForegroundColor Cyan
if (Test-Path -Path "requirements.txt") {
    pip install -r requirements.txt
}else {
    Write-Host "requirements.txt not found. Please ensure the file exists in the current directory." -ForegroundColor Red
    exit 1
}
Write-Host "Applying database migrations..." -ForegroundColor Cyan
python manage.py migrate --no-input
Write-Host "Collecting static files..." -ForegroundColor Cyan
python manage.py collectstatic --no-input
Write-Host "Starting development server..." -ForegroundColor Cyan
python manage.py runserver



$ErrorActionPreference = "Stop"

# Run this script from the NutriLens project root.
$pythonExe = Join-Path (Get-Location) ".venv\Scripts\python.exe"

if (-not (Test-Path ".venv")) {
    py -3.11 -m venv .venv
}

if (-not (Test-Path $pythonExe)) {
    throw "Virtual environment Python was not found at $pythonExe. Confirm Python 3.11 is installed."
}

& $pythonExe -m pip install --upgrade pip
& $pythonExe -m pip install -r backend/requirements.txt

if (-not (Test-Path "backend/.env")) {
    Copy-Item "backend/.env.example" "backend/.env"
}

Write-Host "NutriLens setup complete. Activate with: .\.venv\Scripts\Activate.ps1"
Write-Host "Run API with: python -m uvicorn app.main:app --reload --app-dir backend"
Write-Host "Run tests with: python -m pytest -v"

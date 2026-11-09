# NutriLens 🥗 — Phase 0

NutriLens is an AI-powered food recognition and nutrition analysis application. This Phase 0 package establishes the initial Python project structure and a tested FastAPI backend foundation.

## Included in this phase

- Python project and virtual-environment setup
- Modular backend / ML / frontend directory structure
- FastAPI welcome and health-check endpoints
- Pydantic Settings configuration
- Centralized console logging
- SQLite-ready configuration for local development
- Pytest smoke tests
- Git ignore rules and Ruff configuration

## Requirements

- Windows 11 with PowerShell (commands below use PowerShell)
- Python 3.11
- Git

## 1. Create and activate the virtual environment

From this directory:

```powershell
py -3.11 -m venv .venv
.\.venv\Scripts\Activate.ps1
```

If PowerShell blocks activation in the current window, run:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\.venv\Scripts\Activate.ps1
```

## 2. Install dependencies

```powershell
python -m pip install --upgrade pip
python -m pip install -r backend/requirements.txt
```

Alternatively, run `scripts/setup.ps1` from the project root. It creates the environment if needed, installs requirements, and copies the example environment file.

## 3. Configure environment variables

```powershell
Copy-Item backend/.env.example backend/.env
```

The initial default database URL uses SQLite. PostgreSQL configuration will be introduced in a later phase. Never commit real credentials or API keys.

## 4. Run the backend

Run this command from the project root, with the virtual environment activated:

```powershell
python -m uvicorn app.main:app --reload --app-dir backend
```

Open:

- API welcome: http://127.0.0.1:8000/
- Health check: http://127.0.0.1:8000/api/v1/health
- Swagger documentation: http://127.0.0.1:8000/docs

## 5. Run automated tests

From the project root:

```powershell
python -m pytest -v
```

## 6. Initialize Git

```powershell
git init
git add .
git status
git commit -m "Initial NutriLens Phase 0 setup"
```

If Git has no configured identity, set it first:

```powershell
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

## Project structure

```text
NutriLens_Phase0/
├── backend/
│   ├── .env.example
│   ├── requirements.txt
│   ├── app/
│   │   ├── api/
│   │   ├── core/
│   │   │   ├── config.py
│   │   │   └── logging_config.py
│   │   ├── database/
│   │   ├── models/
│   │   ├── schemas/
│   │   ├── services/
│   │   └── main.py
│   └── tests/
├── ml/
│   ├── datasets/
│   │   ├── raw/
│   │   ├── processed/
│   │   └── annotations/
│   ├── notebooks/
│   ├── src/
│   │   ├── preprocessing/
│   │   ├── classification/
│   │   ├── detection/
│   │   ├── segmentation/
│   │   └── evaluation/
│   └── trained_models/
├── frontend/
├── tests/
├── docs/
├── scripts/
│   └── setup.ps1
├── .gitignore
├── pyproject.toml
└── README.md
```

## Scope and limitations

This archive is the Phase 0 scaffold, not the complete NutriLens product. It does not yet include food datasets, trained AI models, database tables, authentication, nutrition calculations, or a frontend implementation. Those are developed and tested in subsequent phases.


from fastapi import FastAPI

from app.core.config import settings
from app.core.logging_config import logger


app = FastAPI(
    title=settings.APP_NAME,
    description=(
        "AI-powered food recognition and "
        "nutrition analysis platform."
    ),
    version="0.1.0",
)


@app.get("/")
def root():
    return {
        "message": "Welcome to NutriLens AI",
        "status": "running",
        "version": "0.1.0",
    }


@app.get("/api/v1/health")
def health_check():
    logger.info("Health check endpoint accessed")

    return {
        "status": "healthy",
        "application": settings.APP_NAME,
        "environment": settings.APP_ENV,
    }

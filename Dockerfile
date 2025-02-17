# Use official Python image
FROM python:3

# Set the working directory
WORKDIR /app

# Copy dependencies first (for better caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project (including `app/`, `alembic/`, `alembic.ini`)
COPY . .

# Run Alembic migrations before starting the app
CMD ["sh", "-c", "alembic upgrade head && uvicorn app.main:app --host 0.0.0.0 --port 8000"]



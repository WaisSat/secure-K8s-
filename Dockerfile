FROM python:3.12-slim-bookworm

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app.py .

# Security: Create a non-privileged user
RUN useradd -m myuser
USER myuser

EXPOSE 8080

CMD ["python", "app.py"]

# Using Alpine-based Python is much smaller and has a tiny attack surface
FROM python:3.12-alpine

WORKDIR /app

# Install necessary build tools for requirements (if needed), then clean up
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

# Alpine uses 'adduser' instead of 'useradd'
RUN adduser -D myuser
USER myuser

EXPOSE 8080

CMD ["python", "app.py"]
# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONUNBUFFERED True
ENV APP_HOME /app
WORKDIR $APP_HOME

# Install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy application code
COPY . .

# Set production environment
ENV HOST=0.0.0.0
ENV PORT=5000
ENV DEBUG=false

# Expose the port
EXPOSE 5000

# Run the application
CMD exec gunicorn --bind ${HOST}:${PORT} --workers 4 app:app

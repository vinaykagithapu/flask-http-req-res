# Use the official Python image as a base image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the necessary files into the container
COPY requirements.txt /app/
COPY app.py /app/
COPY templates /app/templates/

# Install the required Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port that the application will run on
EXPOSE 5000

# Set environment variable for Flask
ENV FLASK_APP=app.py

# Run the Flask application when the container starts
CMD ["flask", "run", "--host=0.0.0.0"]

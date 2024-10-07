# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY book_catalog/requirements.txt /app/requirements.txt

# Install any dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY book_catalog /app

# Set environment variable (replace <DATABASE_URL> with your actual URL)
ENV DATABASE_URL=<DATABASE_URL>

# Make port 80 available to the world outside this container
EXPOSE 80

# Run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]


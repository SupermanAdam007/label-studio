# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container to /app
WORKDIR /app

# Install any needed packages specified in requirements.txt
# The gcc package is required for compiling certain Python package dependencies
RUN apt-get update && apt-get install -y gcc && rm -rf /var/lib/apt/lists/*

# Install label-studio
RUN pip install --no-cache-dir label-studio

# Copy the local directory contents into the container at /app
# This step is only necessary if you have local files you need to run label-studio
# COPY . /app

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Define environment variable
ENV NAME World

# Run label-studio when the container launches
CMD ["label-studio", "start", "--host", "0.0.0.0", "--port", "8080"]

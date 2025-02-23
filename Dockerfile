# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install iproute2 for ss command
RUN apt-get update && apt-get install -y iproute2

# Make ports 3000 and 5000 available to the world outside this container
EXPOSE 3000

# Run main.py when the container launches
CMD ["python", "main.py"]
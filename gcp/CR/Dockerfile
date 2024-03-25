# Use an official Python runtinme as the base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app 

# Copy the application code to the container COPY requirements.txt .
COPY src/* .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt 

# Expose the port on which the application will run
EXPOSE 8080

# Set the command to run the application when the container starts
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
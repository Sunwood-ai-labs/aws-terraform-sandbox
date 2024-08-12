# Use the official AWS Lambda Python runtime as a parent image
FROM public.ecr.aws/lambda/python:3.9

# Set the working directory in the container
WORKDIR /var/task

# Copy the requirements file used for dependencies
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the working directory contents into the container
COPY . .

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "app.handler" ]

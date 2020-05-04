# We Use an official Python runtime as a parent image
FROM python:3.7-alpine
# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1
# create root directory for our project in the container
RUN mkdir /testapp
# Set the working directory to /music_service
WORKDIR /testapp
# Copy the current directory contents into the container at /music_service
ADD . /testapp/
# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt
EXPOSE 8000
CMD exec gunicorn DockerPractice.wsgi:application  bind 0.0.0.0:8000  workers 3
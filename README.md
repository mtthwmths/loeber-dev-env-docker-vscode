# Summary

This repo was created while following along with [How to create a great dev environment with Docker](https://www.youtube.com/watch?v=0H2miBK_gAk) by [Patrick Loeber](youtube.com/@patloeber)

I've tried to update the container in place and avoid using root user to run tasks like you would do in a production environment, but I'm sure this is all terrible and there are much better ways to accomplish.

Learned a bit about Docker, Docker-Compose, VS Code Dev Containers, Python Virtual Environment, Uvicorn, FastAPI, etc.

Hopefully this helps someone struggling with the same video.

# Prereqs

## Windows 10
1. WSL 2 installed
2. Docker Desktop installed 

# Usage

I was able to view the website at `http://127.0.0.1:8000` on my local machine

I needed to run `$ docker-compose up --build --detach` in my local machine to build the image and start the containers/network

# Dockerfile details

This Dockerfile is designed to provide a secure and isolated environment for running a FastAPI application with its dependencies in a Python virtual environment. 

Key points:
- User and Group Creation:
  - The Dockerfile creates a system user and group named "app" with UID and GID set to 1001.
- Directory Setup:
  - Directories /code and /py-venv are created for the application and Python virtual environment, respectively.
  - Ownership of these directories is set to the "app" user and group.
- Python Virtual Environment:
  - A Python virtual environment is created in the /py-venv directory to isolate Python dependencies for the application.
- Dependency Installation:
  - Python dependencies specified in the requirements.txt file are installed using pip.
  - The pip install commands include an upgrade of pip itself.
  - The requirements.txt file is removed after installation to reduce image size.
- Command for Running the Application:
  - The default command (CMD) starts the FastAPI application using uvicorn with specified host, port, and reload options.

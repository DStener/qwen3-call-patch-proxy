FROM python:3.12-slim

# Installation of dependencies
WORKDIR /app

# Copying files
COPY requirements.txt .
COPY . .

# Installation of dependencies
RUN pip install -r requirements.txt

# Installation of dependencies from pyproject.toml
RUN pip install --no-deps -e .

# Creating a directory for logs
RUN mkdir -p /app/logs

# Setting directory permissions
RUN chmod -R 755 /app

# Starting the application
EXPOSE 7999
CMD ["python", "call_patch_proxy.py"]
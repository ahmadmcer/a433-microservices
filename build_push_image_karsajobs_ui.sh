#!/bin/bash
# Menentukan variabel untuk GitHub Container Registry
USERNAME="ahmadmcer"
IMAGE_NAME="ghcr.io/$USERNAME/karsajobs-ui:latest"

# 1. Build Docker image untuk frontend
echo "Building Docker image for the frontend..."
docker build -t $IMAGE_NAME .

# 2. Login ke GitHub Packages menggunakan PAT
echo "Login to GitHub Container Registry..."
echo $CR_PAT | docker login ghcr.io -u $USERNAME --password-stdin

# 3. Push Docker image ke GitHub Packages
echo "Pushing frontend image to registry..."
docker push $IMAGE_NAME

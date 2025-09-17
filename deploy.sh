#!/bin/bash

# Build the Flutter web app WITHOUT base-href since it will be served from its own domain
echo "Building Flutter web app with FVM..."
fvm flutter build web

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "Build successful! Deploying to Firebase..."
    # Deploy only hosting to Firebase
    firebase deploy --only hosting

    if [ $? -eq 0 ]; then
        echo "Deployment successful!"
        echo "Your app is available at: https://chauapps.com/pet-safe-zone/"
    else
        echo "Deployment failed!"
        exit 1
    fi
else
    echo "Build failed! Deployment cancelled."
    exit 1
fi
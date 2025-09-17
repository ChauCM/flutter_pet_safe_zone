#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Starting deployment process...${NC}"

# Build the Flutter web app using FVM with correct base-href
echo -e "${GREEN}Building Flutter web app with FVM...${NC}"
fvm flutter build web --base-href="/pet-safe-zone/"

# Check if build was successful
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Build successful!${NC}"

    # Copy build files to main project
    echo -e "${YELLOW}Copying files to main project...${NC}"
    rm -rf ../chauapps/dist/pet-safe-zone
    cp -r build/web ../chauapps/dist/pet-safe-zone

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Files copied successfully!${NC}"

        # Deploy to Firebase from main project
        echo -e "${YELLOW}Deploying to Firebase...${NC}"
        cd ../chauapps
        firebase deploy --only hosting

        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✓ Deployment successful!${NC}"
            echo -e "${GREEN}Your app is available at:${NC}"
            echo -e "  • https://chauapps.com/pet-safe-zone/"
            echo -e "  • https://pet-safe-zone.web.app"
        else
            echo -e "${RED}✗ Firebase deployment failed!${NC}"
            exit 1
        fi
    else
        echo -e "${RED}✗ Failed to copy files to main project!${NC}"
        exit 1
    fi
else
    echo -e "${RED}✗ Build failed! Deployment cancelled.${NC}"
    exit 1
fi
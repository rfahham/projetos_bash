#!/bin/bash

# Update system packages to apply security patches
echo "Updating system packages..."
sudo apt update
sudo apt upgrade -y
echo "System packages updated successfully."
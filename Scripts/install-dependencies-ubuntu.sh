#!/bin/bash

echo "Updating packages..."
sudo apt-get update -y

echo "Installing dependencies needed for building..."
sudo apt-get install -y make gcc-arm-none-eabi

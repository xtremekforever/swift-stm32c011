#!/bin/bash

echo "Updating packages..."
sudo dnf update

echo "Installing dependencies needed for building..."
sudo dnf install -y make arm-none-eabi-gcc-cs arm-none-eabi-newlib

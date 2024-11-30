# Use common makefile
include build.mk

# Set library root to current directory
LIBROOT := .

# Only build library by default
all: build

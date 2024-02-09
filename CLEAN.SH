#!/bin/sh

# Little script to clean out the generated and makefiles
find . -type f -name Makefile -delete
find . -type d -name generated -delete
rm -rf unix

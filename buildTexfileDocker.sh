#!/bin/bash

# Pre-Cleanup
rm $(ls | grep -E "(aux|log|nav|out|snm|toc|vrb)$") 2>/dev/null || echo "Nothing found."

# Define Docker image
IMAGE=neikei/latex:v1.0
# First run to create Latex Metadata
docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$PWD":/data "$IMAGE" "$@"
# Second run to create final PDF
docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$PWD":/data "$IMAGE" "$@"

# Post-Cleanup
rm $(ls | grep -E "(aux|log|nav|out|snm|toc|vrb)$") 2>/dev/null || echo "Nothing found."

#!/bin/bash

# Pre-Cleanup
rm $(ls | grep -E "(aux|log|nav|out|snm|toc|vrb|fls|fdb_latexmk)$") 2>/dev/null && rm -rf _minted-example 2>/dev/null || echo "Nothing found."

# Define Docker and let latexmk run as often as needed
IMAGE=neikei/latex:v1.1
docker run --rm --user="$(id -u):$(id -g)" -v "$PWD":/data "$IMAGE" latexmk -xelatex -latexoption="--shell-escape" -interaction=nonstopmode -pdf "$@"

# Post-Cleanup
rm $(ls | grep -E "(aux|log|nav|out|snm|toc|vrb|fls|fdb_latexmk)$") 2>/dev/null && rm -rf _minted-example 2>/dev/null || echo "Nothing found."

#!/bin/bash

# run_inmap.sh - run inmap with config and evaldata mounted

set -e

# === CONFIGURATION ===
IMAGE_NAME="dimaopen/inmap:1.10.0"

HOST_CONFIG_DIR="$(pwd)/eval"        # path to config directory
HOST_EVALDATA_DIR="/simrise_data/evaldata_v1.6.1"  # eval data dir (absolute path)
OUTPUT_DIR="$(pwd)/output"


# === RUN CONTAINER ===
echo "Running inmap with mounted evaldata and config..."

mkdir -p "$OUTPUT_DIR"

docker run --rm \
  -v "$HOST_CONFIG_DIR":/data/eval \
  -v "$HOST_EVALDATA_DIR":/evaldata \
  -v "$OUTPUT_DIR":/app/inmap/output \
  -e evaldata=/evaldata \
  "$IMAGE_NAME" \
  /app/inmap/inmap run steady --config=/data/eval/nei2005Config.toml


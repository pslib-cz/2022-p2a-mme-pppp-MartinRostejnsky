#!/bin/bash
ARGS=""
OUT_APPEND=""
if [[ -n $IS_AARCH64 ]]; then
ARGS="--arch=aarch64"
OUT_APPEND="-aarch64"
fi
flatpak-builder $ARGS --force-clean --repo=out$OUT_APPEND/ ./build-gui flatpak-gui.yml


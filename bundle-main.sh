#!/bin/bash
ARGS=""
OUT_APPEND=""
if [[ -n $IS_AARCH64 ]]; then
ARGS="--arch=aarch64"
OUT_APPEND="-aarch64"
fi
flatpak $ARGS build-bundle ./out$OUT_APPEND/ kiosk$OUT_APPEND.flatpak cz.tttie.KiOS


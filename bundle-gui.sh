#!/bin/bash
ARGS=""
OUT_APPEND=""
if [[ -n $IS_AARCH64 ]]; then
ARGS="--arch=aarch64"
OUT_APPEND="-aarch64"
fi
flatpak build-bundle $ARGS --runtime ./out$OUT_APPEND/ kiosk-gui.flatpak cz.tttie.KiOS.UI


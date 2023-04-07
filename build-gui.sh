#!/bin/bash
flatpak-builder --force-clean --repo=out/ ./build-gui flatpak-gui.yml


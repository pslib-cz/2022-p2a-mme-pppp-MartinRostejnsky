#!/bin/bash
flatpak-builder --force-clean --repo=out/ ./build flatpak-main.yml


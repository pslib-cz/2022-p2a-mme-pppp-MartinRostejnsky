#!/bin/bash
VERSION="5.15-22.08"

flatpak install org.kde.Platform//$VERSION
flatpak install org.kde.Sdk//$VERSION
flatpak install com.riverbankcomputing.PyQt.BaseApp//$VERSION

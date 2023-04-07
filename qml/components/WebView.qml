//pip install PyQtWebEngine
//This concept is more of an experiment

import QtQuick 2.12
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15
import QtWebEngine 1.10
import "../utils" as Utils
import "../api" as API

WebEngineView {
    profile.offTheRecord: true
}
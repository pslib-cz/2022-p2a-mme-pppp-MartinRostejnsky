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
    property var allowed: [
        "https://pslib.cz/",
        "http://praxe2.pslib.cloud/"
    ]
    profile.offTheRecord: true
    id: webview
    onNewViewRequested: function(request) {
        print(request.requestedUrl)
        if (allowed.includes(String(request.requestedUrl))) {
            request.openIn(webview)
        }
    }
    onNavigationRequested: function(request) {
        print(request.url)
        if (allowed.includes(String(request.url))) {
            request.action = WebEngineNavigationRequest.AcceptRequest
            print("skinhead")
        } else {
            request.action = WebEngineNavigationRequest.IgnoreRequest
        }
    }

}
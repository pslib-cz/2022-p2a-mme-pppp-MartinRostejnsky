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
        "https://bakalar.pslib.cz",
        "http://praxe2.pslib.cloud/",
        "https://praxe2.pslib.cloud/" //musi byt oboje, protoze odkaz odkazuje na http ktery to presmeruje na https...
    ]
    profile.offTheRecord: true
    id: webview
    onNewViewRequested: function(request) {
        print(request.requestedUrl)
        if (allowed.some(sub => String(request.requestedUrl).startsWith(sub))) {
            request.openIn(webview)
        }
    }
    onNavigationRequested: function(request) {
        print(request.url)
        if (allowed.some(sub => String(request.url).startsWith(sub))) {
            request.action = WebEngineNavigationRequest.AcceptRequest
        } else {
            request.action = WebEngineNavigationRequest.IgnoreRequest
        }
    }

}
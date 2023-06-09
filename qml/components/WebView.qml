//pip install PyQtWebEngine
//This concept is more of an experiment

import QtQuick 2.12
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15
import QtWebEngine 1.10
import URLUtils 1.0
import "../utils" as Utils
import "../api" as API
import "../Constants.js" as Constants

Item {
    id: root

    property alias url: webview.url

    property var allowedOrigins: [
        "pslib.cz",
        // Opravdu chceme, aby se nekdo registroval z kiosku na praxe?
        "praxe2.pslib.cloud"
    ]

    property var allowedUrls: [
        "https://bakalar.pslib.cz/rodice/Timetable/Public",
        "https://bakalar.pslib.cz/rodice/next/zmeny.aspx"
    ];


    WebEngineView {
        anchors.fill: root
        URLUtils {
            id: urlUtils
        }

        profile.offTheRecord: true
        id: webview
        onNewViewRequested: function(request) {
            print(`New view requested at ${request.requestedUrl}, origin: ${urlUtils.getOrigin(request.requestedUrl)}`)
            if (root.allowedOrigins.includes(urlUtils.getOrigin(request.requestedUrl)) 
                || root.allowedUrls.some(x => String(request.requestedUrl).startsWith(x))) {
                request.openIn(webview)
            } else {
                // TODO: Maybe it would be worth it to let the user know?
                print(`${request.requestedUrl} isn't in the list of allowed origins`)
            }
        }
        onNavigationRequested: function(request) {
            print(`Navigation requested at ${request.url}, origin: ${urlUtils.getOrigin(request.url)}`)
            if (root.allowedOrigins.includes(urlUtils.getOrigin(request.url)) 
                || root.allowedUrls.some(x => String(request.url).startsWith(x))) {
                request.action = WebEngineNavigationRequest.AcceptRequest
            } else {
                print(`${request.url} isn't in the list of allowed origins`)
                // TODO: Maybe it would be worth it to let the user know?
                request.action = WebEngineNavigationRequest.IgnoreRequest
            }
        }

        onContextMenuRequested: function(ev) {
            // Disallow context menus
            ev.accepted = true;
        }
    }
    
    HomeButton {}
}

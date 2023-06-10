import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15

import "api" as API
import "utils" as Utils
import "./Constants.js" as Constants

ApplicationWindow {
    visible: true
    color: "white"

    minimumWidth: 50 * Constants.baseSize
    minimumHeight: 30 * Constants.baseSize

    font.family: Constants.fontFamily

    visibility: "FullScreen"

    title: "KiOS"
    StackView {
        // anchors.topMargin: -6
        id: root
        background: Rectangle {
            color: Constants.backgroundColor
        }
        anchors.fill: parent

        clip: true
    }

    Component.onCompleted: {
        API.PageSwitcher.setRoot(root);

        for (const [pageName, pageFile] of Object.entries(Constants.pages)) {
            API.PageSwitcher.createPage(pageName, pageFile);
        }

        API.PageSwitcher.navigateTo(Constants.landingPage);
    }

}

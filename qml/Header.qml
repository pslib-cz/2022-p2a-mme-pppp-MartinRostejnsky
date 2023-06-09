import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15
import "utils" as Utils
import "components" as Components
import "api" as API
import "./Constants.js" as Constants

Rectangle {
    id: root

    anchors.leftMargin: 2.25 * Constants.baseSize
    anchors.rightMargin: 2.25 * Constants.baseSize
    height: 6 * Constants.baseSize

    color: "transparent"

    Utils.DPIAwareSVGImage {
        anchors.left: root.left
        anchors.verticalCenter: root.verticalCenter
        source: "icons/logo.svg"

        height: 3.75 * Constants.baseSize
        width: 14.125 * Constants.baseSize
    }

    Text {
        id: time
        anchors.right: root.right
        anchors.verticalCenter: root.verticalCenter
        color: Constants.textColor
        font.weight: Font.Bold
        font.family: Constants.fontFamily

        font.pixelSize: 1.5 * Constants.baseSize
        text: Qt.formatDateTime(new Date(), "dd. MM. yyyy hh:mm:ss")
    }
    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: time.text = Qt.formatDateTime(new Date(), "dd. MM. yyyy hh:mm:ss")
    }
}



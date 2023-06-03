import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15
import "utils" as Utils
import "components" as Components
import "api" as API

Rectangle {
    id: root

    anchors.leftMargin: 36
    anchors.rightMargin: 36
    height: 96

    color: "transparent"

    Utils.DPIAwareSVGImage {
        anchors.left: root.left
        anchors.verticalCenter: root.verticalCenter
        source: "icons/logo.svg"
    }

    Text {
        id: time
        anchors.right: root.right
        anchors.verticalCenter: root.verticalCenter
        color: "#565655"
        font.weight: Font.Bold

        font.pixelSize: 24
        text: Qt.formatDateTime(new Date(), "dd. MM. yyyy hh:mm:ss")
    }
    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: time.text = Qt.formatDateTime(new Date(), "dd. MM. yyyy hh:mm:ss")
    }
}



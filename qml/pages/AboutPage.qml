import QtQuick 2.12
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15
import Meta 1.0
import "../utils" as Utils
import "../api" as API

Item {
    id: root
    Meta {
        id: meta
    }
    Rectangle {
        radius: 4
        z: 1
        anchors.centerIn: parent

        color: "white"
        width: 640
        height: 800

        ScrollView {
            id: layout
            width: 640
            height: 800
            anchors.centerIn: parent

            Column {
                anchors.fill: parent
                anchors.leftMargin: 36
                anchors.rightMargin: 36
                anchors.topMargin: 44
                anchors.bottomMargin: 44
                
                Text {
                    color: "#2f65b0"
                    font.pixelSize: 48
                    font.weight: Font.Bold
                    text: "O aplikaci"
                }

                Text {
                    width: 640 - 72
                    color: "#565655"
                    font.pixelSize: 24
                    wrapMode: Text.Wrap
                    text: `Built using Qt v${meta.qtVersion} and Python v${meta.pyVersion}`
                }
            }
        }
    }

    Image {
        id: skola
        source: "../images/skola.png"

        anchors.fill: parent

        fillMode: Image.PreserveAspectCrop
    }
    Rectangle {
        id: bg
        anchors.fill: parent
        color: "#72e9e9e9"
    }


    Blend {
        z: 0
        source: skola
        foregroundSource: bg
        anchors.fill: parent
    }
}
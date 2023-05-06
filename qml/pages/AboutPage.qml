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
        id: rootRectangle
        radius: 4
        z: 1
        anchors.centerIn: parent

        color: "white"
        width: Math.min(parent.width, 640 + (anchors.topMargin + anchors.bottomMargin)) - (anchors.leftMargin + anchors.rightMargin)
        height: Math.min(parent.height, 800 + (anchors.topMargin + anchors.bottomMargin)) - (anchors.topMargin + anchors.bottomMargin)

        anchors.margins: 8


        ScrollView {
            id: layout
            anchors.fill: parent
            contentWidth: parent.width
            contentHeight: parent.height

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
                    width: parent.width - (anchors.leftMargin + anchors.rightMargin)
                    text: "O aplikaci"
                }

                Text {
                    color: "#565655"
                    font.pixelSize: 24
                    wrapMode: Text.Wrap
                    width: parent.width - (anchors.leftMargin + anchors.rightMargin)
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
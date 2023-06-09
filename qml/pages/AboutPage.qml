import QtQuick 2.12
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15
import Meta 1.0
import "../utils" as Utils
import "../api" as API
import "../components" as Components
import "../Constants.js" as Constants

Item {
    id: root

    Meta {
        id: meta
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

    Components.HomeButton {}

    Rectangle {
        id: rootRectangle
        radius: Constants.baseSize / 4
        z: 1
        anchors.centerIn: parent

        color: "white"
        width: Math.min(parent.width, 40 * Constants.baseSize + (anchors.topMargin + anchors.bottomMargin)) - (anchors.leftMargin + anchors.rightMargin)
        height: Math.min(parent.height, 50 * Constants.baseSize + (anchors.topMargin + anchors.bottomMargin)) - (anchors.topMargin + anchors.bottomMargin)

        anchors.margins: Constants.baseSize / 2


        ScrollView {
            id: layout
            anchors.fill: parent
            contentWidth: parent.width
            contentHeight: parent.height

            Column {
                anchors.fill: parent

                anchors.leftMargin: 2.25 * Constants.baseSize
                anchors.rightMargin: 2.25 * Constants.baseSize
                anchors.topMargin: 2.75 * Constants.baseSize
                anchors.bottomMargin: 2.75 * Constants.baseSize
                
                Text {
                    color: Constants.headingColor
                    font.pixelSize: 4 * Constants.baseSize
                    font.family: Constants.fontFamily
                    font.weight: Font.Bold
                    width: parent.width - (anchors.leftMargin + anchors.rightMargin)
                    text: "O aplikaci"
                }

                Text {
                    color: Constants.textColor
                    font.pixelSize: 1.5 * Constants.baseSize
                    font.family: Constants.fontFamily
                    wrapMode: Text.Wrap
                    width: parent.width - (anchors.leftMargin + anchors.rightMargin)
                    text: `Built using Qt v${meta.qtVersion} and Python v${meta.pyVersion}`
                }
            }
        }
    }
}
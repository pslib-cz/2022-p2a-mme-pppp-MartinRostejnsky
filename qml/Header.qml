import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15
import "utils" as Utils
import "components" as Components
import "api" as API

Item {
    height: 103

    anchors.left: parent.left
    anchors.right: parent.right

    Item {
        anchors.leftMargin: 36
        anchors.rightMargin: 36
        anchors.topMargin: 18
        anchors.bottomMargin: 25
        height: 96

        anchors.fill: parent

        Utils.DPIAwareSVGImage {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            source: "icons/logo.svg"
        }


        Components.Button {
            anchors.centerIn: parent
            icon.source: "icons/home_button.svg"

            onClicked: {
                API.PageSwitcher.navigateTo("home")
            }

            background: Rectangle {
                implicitWidth: contentItem.implicitWidth + 2 * 16
                implicitHeight: contentItem.implicitHeight + 2 * 16

                color: "white"
            }
        }

        Text {
            id: time
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            color: "#565655"
            font.weight: Font.Bold

            font.pixelSize: 24
            text: Qt.formatDateTime(new Date(), "dd. MM. yyyy hh:mm:ss")
        }
    }



    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: time.text = Qt.formatDateTime(new Date(), "dd. MM. yyyy hh:mm:ss")
    }

    Rectangle { // Border, could be done better, but it works for now
        id: border
        color: "#DDDDDD"
        height: 1
        anchors.bottom: gradientBorder.top
        anchors.left: parent.left
        anchors.right: parent.right
    }
    //I give up
    Rectangle {
        id: gradientBorder
        height: 6
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        gradient: Gradient {
            GradientStop { position: 0.0; color: "#60000000" }
            GradientStop { position: 1.0; color: "#10000000" }
        }
    }
}

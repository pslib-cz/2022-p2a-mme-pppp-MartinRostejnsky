import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15
import "../utils" as Utils
import "../api" as API
import "../" as Root
import "../Constants.js" as Constants

Item {
    id: root
    Root.Header {
        id: hdr

        anchors.top: root.top
        anchors.left: root.left
        anchors.right: root.right
    }

    Item {
        anchors.top: hdr.bottom
        anchors.bottom: root.bottom
        anchors.left: root.left
        anchors.right: root.right

        GridLayout {
            anchors.centerIn: parent
            columns: 2
            rows: 3

            // https://stackoverflow.com/questions/5731863/mapping-a-numeric-range-onto-another
            columnSpacing: Math.min((root.width - 50 * Constants.baseSize) * (6.25 * Constants.baseSize - 0.625 * Constants.baseSize) / (120 * Constants.baseSize - 50 * Constants.baseSize) + 0.625 * Constants.baseSize, 6.25 * Constants.baseSize)
            rowSpacing: Math.min((root.height - 30 * Constants.baseSize) * (6.25 * Constants.baseSize - 0.625 * Constants.baseSize) / (67.5 * Constants.baseSize - 30 * Constants.baseSize) + 0.625 * Constants.baseSize, 6.25 * Constants.baseSize)

            Text {
                Layout.columnSpan: 2
                Layout.alignment: Qt.AlignCenter

                text: "Kam to bude?"
                color: Constants.headingColor

                font.family: Constants.fontFamily
                font.weight: Font.ExtraBold
                font.pixelSize: 5 * Constants.baseSize
            }

            Utils.MainPageButton {
                icon: "timetable"
                text: "Rozvrh"

                btn.onClicked: {
                    API.PageSwitcher.navigateTo("timetable")
                }
            }

            Utils.MainPageButton {
                icon: "suplovani"
                text: "Suplování"

                btn.onClicked: {
                    API.PageSwitcher.navigateTo("suplovani")
                }
            }

            Utils.MainPageButton {
                icon: "web"
                text: "Web"

                btn.onClicked: {
                    API.PageSwitcher.navigateTo("web")
                }
            }

            Utils.MainPageButton {
                icon: "about"
                text: "O aplikaci"

                btn.onClicked: {
                    API.PageSwitcher.navigateTo("about")
                }
            }
        }
    }
}
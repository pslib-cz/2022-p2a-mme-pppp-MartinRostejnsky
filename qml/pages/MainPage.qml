import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15
import "../utils" as Utils
import "../api" as API

Item {
    GridLayout {
        anchors.centerIn: parent
        columns: 2
        rows: 3

        columnSpacing: 100
        rowSpacing: 100

        Text {
            Layout.columnSpan: 2
            Layout.alignment: Qt.AlignCenter

            text: "Kam to bude?"
            color: "#2f65b0"

            font.weight: Font.ExtraBold
            font.pixelSize: 80
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
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15
import "../utils" as Utils
import "../api" as API

Item {
    id: root
    GridLayout {
        anchors.centerIn: parent
        columns: 2
        rows: 3

        // https://stackoverflow.com/questions/5731863/mapping-a-numeric-range-onto-another
        // 103 is the height of the navigation header
        columnSpacing: Math.min((root.width - 800) * (100 - 10) / (1920 - 800) + 10, 100)
        rowSpacing: Math.min((root.height - (480 - 103)) * (100 - 10) / ((1080 - 103) - 360) + 10, 100)

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
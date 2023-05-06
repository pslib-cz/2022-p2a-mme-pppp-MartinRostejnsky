import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15
import "../utils" as Utils

Button {
    id: root

    contentItem: RowLayout {
        spacing: 16

        Item {
            Layout.fillWidth: true

            visible: root.text !== ""
        }

        Utils.DPIAwareSVGImage {
            Layout.alignment: Qt.AlignCenter
            source: root.icon.source
        }

        Text {
            Layout.alignment: Qt.AlignCenter
            color: "white"
            font: root.font
            text: root.text
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight

            visible: root.text !== ""
        }

        Item {
            Layout.fillWidth: true

            visible: root.text !== ""
        }
    }

    background: Rectangle {
        implicitWidth: contentItem.implicitWidth + 2 * 16
        implicitHeight: contentItem.implicitHeight + 2 * 16

        color: "#2f65b0"
    }
}
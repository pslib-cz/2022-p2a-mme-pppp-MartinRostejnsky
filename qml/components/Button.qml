import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15
import "../utils" as Utils
import "../Constants.js" as Constants

Button {
    id: root

    contentItem: RowLayout {
        spacing: Constants.baseSize

        Item {
            Layout.fillWidth: true

            visible: root.text !== ""
        }

        Utils.DPIAwareSVGImage {
            Layout.alignment: Qt.AlignCenter
            source: root.icon.source

            fillMode: Image.PreserveAspectFit

            Layout.preferredHeight: 2.5 * Constants.baseSize
            Layout.preferredWidth: 2.5 * Constants.baseSize
        }

        Text {
            Layout.alignment: Qt.AlignCenter
            color: Constants.buttonTextColor
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
        implicitWidth: contentItem.implicitWidth + 2 * Constants.baseSize
        implicitHeight: contentItem.implicitHeight + 2 * Constants.baseSize

        color: Constants.buttonColor
    }
}
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15
import "../components" as Components
import "../Constants.js" as Constants

Item {
    id: root
    property string icon
    property alias text: btn.text

    property alias btn: btn

    Layout.preferredHeight: 7.5 * Constants.baseSize
    Layout.preferredWidth: 22.5 * Constants.baseSize
    Components.Button {
        anchors.fill: parent
        id: btn

        icon.source: `../icons/${root.icon}.svg`

        font.family: Constants.fontFamily
        font.pixelSize: 3 * Constants.baseSize
        font.weight: Font.Bold
    }
}

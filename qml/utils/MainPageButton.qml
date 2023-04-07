import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15
import "../components" as Components

Item {
    id: root
    property string icon
    property alias text: btn.text

    property alias btn: btn

    Layout.preferredHeight: 120
    Layout.preferredWidth: 360
    Components.Button {
        anchors.fill: parent
        id: btn

        icon.source: `../icons/${root.icon}.svg`

        font.pixelSize: 48
        font.weight: Font.Bold
    }
}

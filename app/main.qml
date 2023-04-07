import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    color: "#ffffff"
    minimumWidth: 1024
    minimumHeight: 768

    visibility: "FullScreen"

    ColumnLayout {
        Text {
            Layout.alignment: Qt.AlignHCenter
            text: "😭"
            font.weight: Font.Bold
            font.family: "Noto Color Emoji"
            font.pixelSize: 144
        }
        Text {
            Layout.alignment: Qt.AlignHCenter
            text: "No available GUI"
            font.weight: Font.Bold
            font.pixelSize: 36
        }

        anchors.centerIn: parent
    }
}

import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.2
Image {
    sourceSize {
        width: img.width * Math.max(Screen.devicePixelRatio, width / img.width)
        height: img.height * Math.max(Screen.devicePixelRatio, height / img.height)
    }

    Image {
        id: img
        enabled: false
        visible: false

        source: parent.source
    }
}
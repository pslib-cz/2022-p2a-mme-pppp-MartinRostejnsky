import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.2
Image {
    sourceSize {
        width: img.width * Screen.devicePixelRatio
        height: img.height * Screen.devicePixelRatio
    }

    Image {
        id: img
        enabled: false
        visible: false

        source: parent.source
    }
}
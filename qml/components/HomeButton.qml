import QtQuick 2.12
import "../api" as API
import "../Constants.js" as Constants

Button {
    id: btn
    z: 2

    anchors.top: root.top
    anchors.right: root.right

    anchors.rightMargin: 2.25 * Constants.baseSize
    anchors.topMargin: 2.25 * Constants.baseSize

    icon.source: "../icons/home_button.svg"

    onClicked: {
        API.PageSwitcher.navigateTo(Constants.landingPage)
    }

    background: Rectangle {
        implicitWidth: btn.contentItem.implicitWidth + 2 * Constants.baseSize
        implicitHeight: btn.contentItem.implicitHeight + 2 * Constants.baseSize
        radius: Constants.baseSize / 4

        color: Constants.backgroundColor
    }
}
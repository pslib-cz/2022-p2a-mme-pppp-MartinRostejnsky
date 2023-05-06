import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15

import "api" as API
import "utils" as Utils

ApplicationWindow {
    visible: true
    color: "white"

    minimumWidth: 800
    minimumHeight: 480

    font.family: "Noto Sans"

    visibility: "FullScreen"

    title: "KiOS"

    header: Header {
        id: hdr
    }

    StackView {
        anchors.topMargin: -6
        id: root
        background: Rectangle {
            color: "#e9e9e9"
        }
        anchors.fill: parent

        clip: true
    }

    Component.onCompleted: {
        API.PageSwitcher.setRoot(root)
        API.PageSwitcher.createPage("home", "MainPage.qml");
        API.PageSwitcher.createPage("about", "AboutPage.qml");
        API.PageSwitcher.createPage("web", "WebPage.qml");
        API.PageSwitcher.createPage("timetable", "TimeTablePage.qml");
        API.PageSwitcher.createPage("suplovani", "SubstitutionsPage.qml");
        API.PageSwitcher.navigateTo("home")
    }

}

pragma Singleton

import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15

QtObject {
    property string currentPage
    property var currentPageComponent

    id: root


    function createPage(name, page) {
        if (_internal.map[name]) return;

        // Relativize the values
        _internal.map[name] = `../pages/${page}`;
    }

    function navigateTo(page) {
        if (currentPage === page) return;
        if (!_internal.map[page]) return;

        currentPage = page;
        const comp = _internal.componentCache[_internal.map[page]] || 
            (_internal.componentCache[_internal.map[page]] = Qt.createComponent(_internal.map[page]));

        if (comp.status === Component.Ready) {
            const oldComponent = currentPageComponent;
            currentPageComponent = comp.createObject(_internal.root);
            _internal.root.replace(oldComponent, currentPageComponent);
            if (oldComponent) oldComponent.destroy();
        } else if (comp.status === Component.Error) {
            const oldComponent = currentPageComponent;
            currentPageComponent = Qt.createQmlObject(`
                import QtQuick 2.12
                import QtQuick.Layouts 1.15
                Item {
                    property alias error:err.text
                    ColumnLayout {
                        anchors.centerIn: parent

                        Text {
                            color: "red"
                            text: \`Error loading ${_internal.map[page]}:\`
                            font.weight: Font.Bold
                        }
                        Text {
                            id: err
                            font.family: "monospace"
                        }
                    }
                }
            `, _internal.root, `(error) ${page}.qml`);
            currentPageComponent.error = comp.errorString();
            if (oldComponent) oldComponent.destroy();
            _internal.root.replace(oldComponent, currentPageComponent);
        }
    }

    function setRoot(root) {
        _internal.root = root;
    }

    property var _internal: QtObject {
        id: internal

        property var map: { return {}; }

        property var componentCache: { return {}; }

        property var root;
    }
}

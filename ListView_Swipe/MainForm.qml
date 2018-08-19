import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Rectangle {
    id: rect
    anchors.fill: parent
    Row {
        anchors.fill: parent
        ListView {
            id: list
            width: 150
            height: parent.height
            model: myModel
            spacing: 2
            delegate: Component {
                Item {
                    property int indexOfThisDelegate: index

                    width: parent.width - scrollBar.width
                    height: 40
                    TextEdit {
                        property string fullText: indexOfThisDelegate + ' ' + propertyNameRole + ' ' + nameValueRole

                        id: delegateTextEdit
                        width: parent.width
                        wrapMode: Text.NoWrap
                        readOnly: true
                        text: delegateTextEditMetrics.elidedText

                        TextMetrics {
                            id: delegateTextEditMetrics
                            elide: Text.ElideRight
                            elideWidth: delegateTextEdit.width - 10
                            text: delegateTextEdit.fullText
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: list.currentIndex = index
                    }
                }
            }
            focus: true
            ScrollBar.vertical: ScrollBar {
                id: scrollBar
                active: true
                width: 20
            }
            highlight: Rectangle {
                color: "lightsteelblue";
                radius: 5
            }
            highlightMoveDuration: 50
        }
        SwipeView {
            id: swipe
            orientation: Qt.Vertical
            currentIndex: list.currentIndex
            onCurrentIndexChanged: list.currentIndex = currentIndex
            width: parent.width - list.width
            height: parent.height

            Repeater {
                model: list.count
                Column {
                    id: child
                    spacing: 5
                    height: childrenRect.height
                    Text { text: 'Name:' + ' Sergey ' + list.currentIndex }
                    Text { text: 'Last Name: ' + 'Test ' + list.currentIndex }
                    Text { text: 'Phone number: ' + '0123456798 ' + list.currentIndex }

                    Image {
                        id: image
                        height: 100
                        source: "qml_cpp.png"
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }
        }
    }
}

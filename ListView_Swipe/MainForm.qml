import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Rectangle {
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
                        property string fullText: indexOfThisDelegate + ' ' + role1 + ' ' + role2

                        id: textEdit
                        width: parent.width
                        wrapMode: Text.NoWrap
                        readOnly: true
                        text: metrics.elidedText

                        TextMetrics {
                            id: metrics
                            elide: Text.ElideRight
                            elideWidth: textEdit.width - 10
                            text: textEdit.fullText
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: list.currentIndex = index
                    }
                }
            }
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
            orientation: Qt.Vertical
            currentIndex: list.currentIndex
            onCurrentIndexChanged: list.currentIndex = currentIndex
            width: parent.width - list.width
            height: parent.height

            Repeater {
                model: list.count
                Column {
                    spacing: 5
                    Text { text: 'Name: Sergey ' + list.currentIndex }
                    Text { text: 'Last Name: Test ' + list.currentIndex }
                    Text { text: 'Phone number: 0123456798 ' + list.currentIndex }

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

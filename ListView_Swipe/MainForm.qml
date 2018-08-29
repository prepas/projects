import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Rectangle {
    id: root
    anchors.fill: parent
    SplitView {
        orientation: Qt.Horizontal
        ListView {
            id: list
            width: 150
            Layout.maximumWidth: 250
            Layout.minimumWidth: 100
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
                        font.pixelSize: 14

                        TextMetrics {
                            id: metrics
                            elide: Text.ElideRight
                            elideWidth: textEdit.width - scrollBar.width - 10
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
            width: root.width - list.width
            height: root.height

            Repeater {
                model: list.count
                Column {
                    spacing: 5
                    Text { text: 'Name: Sergey ' + list.currentIndex; font.pixelSize: 14 }
                    Text { text: 'Last Name: Test ' + list.currentIndex; font.pixelSize: 14 }
                    Text { text: 'Phone number: 0123456798 ' + list.currentIndex; font.pixelSize: 14 }

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

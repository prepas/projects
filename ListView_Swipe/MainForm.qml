import QtQuick 2.7
import QtQuick.Controls 2.0

Rectangle {
    id: rect
    anchors.fill: parent
    Row {
        anchors.topMargin: 10
        anchors.leftMargin: 10
        anchors.fill: parent
        Column {
            id: columnLeft
            width: 200
            height: parent.height

            ListView {
                id: list
                anchors.fill: parent
                model: myModel
                delegate: Component {
                    Item {
                        width: parent.width - scrollBar.width
                        height: 40
                        Column {
                            Text { text: 'Name:' + propertyNameRole }
                            Text { text: 'Number:' + nameValueRole }
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
        }
        Column
        {
            width: parent.width - columnLeft.width
            height: parent.height
            ListView {
                header: Text {
                    text: "Header"

                }

                anchors.fill: parent
                model: myModel
                delegate: Component {
                    Item {
                        width: parent.width
                        height: 40
                        Text { text: 'Name:' + propertyNameRole + ' ' + nameValueRole + ' ' + list.currentIndex }
                    }
                }
                focus: true
                ScrollBar.vertical: ScrollBar { active: true}
            }
        }
    }
}

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
                spacing: 2
                delegate: Component {
                    Item {
                        width: parent.width - scrollBar.width
                        height: 40
                        Column {
                            Text { text: 'Name: ' + propertyNameRole }
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
            SwipeView {
                id: swipe
                anchors.fill: parent
                orientation: Qt.Vertical
                currentIndex: list.currentIndex
                onCurrentIndexChanged: list.currentIndex = currentIndex

                Repeater {
                    model: list.count

                    ListView {
                        Column {
                            spacing: 5
                            Text { text: 'Name:' + ' Sergey ' + list.currentIndex }
                            Text { text: 'Last Name: ' + 'Test ' + list.currentIndex }
                            Text { text: 'Phone number: ' + '0123456798 ' + list.currentIndex }
                        }
                        focus: true
                        ScrollBar.vertical: ScrollBar { active: true}
                    }
                }
            }
        }
    }
}

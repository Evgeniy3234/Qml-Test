import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import QtQml.Models 2.1

Window {
    id: anotherWindow
    signal signalExit
    width: 640
    height: 480

    Button {
        text: qsTr("Первое окно")
        width: 300
        height: 50
        y: 30
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            anotherWindow.signalExit()
        }
    }

    Flickable {
        width: 600
        height: 600
        y: 100
        anchors.horizontalCenter: parent.horizontalCenter

        Flow {
            anchors.margins: 10
            anchors.fill: parent
            spacing: 10
}

            ListModel {
                id: dataModel


                ListElement {
                    heigth : 30
                    width : 200
                }
                ListElement {
                    heigth : 30
                    width : 200
                }
                ListElement {
                    heigth : 30
                    width : 200
                }
                ListElement {
                    heigth : 30
                    width : 200
                }

            }

        ListView {
            id: view

            anchors.margins: 10
            anchors.fill: parent
            spacing: 10
            model: dataModel
            clip: true

            delegate: Item {
                id: listDelegate

                property var isCurrent: ListView.isCurrentItem

                width: (ListView.isCurrentItem ? 500 : 400)
                height: (ListView.isCurrentItem ? 60 : 40)

                Rectangle {
                    anchors.margins: 5
                    anchors.fill: parent
                    color: Qt.rgba(Math.random(),Math.random(),Math.random(),1)

                    MouseArea {
                        anchors.fill: parent
                        onClicked: view.currentIndex = model.index
                    }
                }
            }
        }
    }
}

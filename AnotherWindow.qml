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
            id: flickable
            clip: true
            width: 400
            height: 300
            y: 100
            anchors.horizontalCenter: parent.horizontalCenter


            ListModel {
                id: dataModel
                dynamicRoles: true              // делмаем типы ролей динамическими
                Component.onCompleted: {        // первичное монтирование
                    append({ color: "red",text: "Text", })
                    append({ color: "green",text: "Text" })
                    append({ color: "red",text: "Text" })
                    append({ color: "green",text: "Text" })
                    append({ color: "red",text: "Text" })
                    append({ color: "green",text: "Text" })
                    append({ color: "red",text: "Text" })
                    append({ color: "green",text: "Text" })
                    append({ color: "green",text: "Text" })
                    append({ color: "red",text: "Text" })
                    append({ color: "green",text: "Text" })
                    append({ color: "green",text: "Text" })
                    append({ color: "red",text: "Text" })
                    append({ color: "green",text: "Text" })
                }
            }

            Flow {
                anchors.margins: 10
                anchors.fill: parent
                spacing: 10

                ListView {
                    id: view

                    anchors.margins: 10
                    anchors.fill: parent
                    spacing: 10
                    model: dataModel
                    contentWidth: parent.width
                    contentHeight: parent.height
                    ScrollBar.vertical: ScrollBar { id: vbar; active: hbar.active }

                    delegate: Rectangle {
                        property var isCurrent: ListView.isCurrentItem
                        width: (ListView.isCurrentItem ? 250 : 120)
                        height: (ListView.isCurrentItem ? 100 : 80)
                        color: Qt.rgba(Math.random(),Math.random(),Math.random(),1)
                        Text {
                            text: "Flow dosn`t work"
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter

                        }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: view.currentIndex = model.index

                            }
                    }
                }
           }

        }




}

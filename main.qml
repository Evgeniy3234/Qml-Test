import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import QtQml.Models 2.1


ApplicationWindow {
    id: mainWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Первое окно")

    Button {                            // Кнопка для открытия второго второстепенного окна приложения
        text: qsTr("Второе окно")
        width: 300
        height: 50
        anchors.horizontalCenter: parent.horizontalCenter
        y: 20

        onClicked: {
            secondWindow.show()      // Открываем второе окно
            mainWindow.hide()       // Скрываем первое окно
        }
    }
    Flickable {
        width: 360
        height: 360
        anchors.horizontalCenter: parent.horizontalCenter
        y: 80

        ListModel {
            id: dataModel

            dynamicRoles: true               // делмаем типы ролей динамическими
            Component.onCompleted: {        // первичное монтирование
                append({ color: "red" })
            }
        }

        Column {
            anchors.margins: 10
            anchors.fill: parent
            spacing: 10

            ListView {
                id: view

                width: parent.width
                height: parent.height - buttonAdd.height - parent.spacing
                spacing: 10
                model: dataModel
                clip: true                      // что бы при скролле элементы не налезали друг на друга

                delegate: Rectangle {
                    width: view.width
                    height: 40
                    color: model.color
                    MouseArea {
                        anchors.fill: parent
                        onClicked: dataModel.remove(index)
                    }
                }
            }

            Rectangle {                       // кнопка Add
                id: buttonAdd

                width: 100
                height: 40
                anchors.horizontalCenter: parent.horizontalCenter
                border {
                    color: "black"
                    width: 1
                }

                Text {
                    anchors.centerIn: parent
                    renderType: Text.NativeRendering
                    text: "Add"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: dataModel.append({ color: Qt.rgba(Math.random(),Math.random(),Math.random(),1) })
                }
            }

        }
    }


    AnotherWindow {
        id: secondWindow
        title: qsTr("Второе окно")

        onSignalExit: {              // Обработчик сигнала на открытие первого окна
            secondWindow.close()    // Закрываем второе окно
            mainWindow.show()      // Показываем первое окно
        }
    }
}

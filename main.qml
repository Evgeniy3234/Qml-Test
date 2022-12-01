import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import QtQml.Models 2.1


ApplicationWindow {
    id: mainWindow
    visible: true
    width: 640
    height: 600
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
            id: flickable
            clip: true
            width: 400
            height: 300
            y: 100
            anchors.horizontalCenter: parent.horizontalCenter

        ListModel {
            id: dataModel
            dynamicRoles: true
            Component.onCompleted: {        // первичное монтирование
                append({text:"Hello", color: "red" })
                append({text:"User", color: "green" })
            }
        }

        Column {
            anchors.margins: 10
            anchors.fill: parent
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10


            ListView {
                id: view

                width: parent.width
                height: 300
                spacing: 10
                model: dataModel
                contentWidth: parent.width
                contentHeight: parent.height
                ScrollBar.vertical: ScrollBar { id: vbar; active: hbar.active }

                delegate: Rectangle {
                    width: parent.width
                    height: 40
                    color: model.color
                    Text {
                            anchors.centerIn: parent
                            renderType: Text.NativeRendering
                            text: model.text || "New Rectangle"
                      }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: dataModel.remove(index)
                    }
                }
            }
        }
    }

    Rectangle {
        id: buttonAdd

        width: 100
        height: 40

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: flickable.bottom
        anchors.topMargin: 50

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


    AnotherWindow {
        id: secondWindow
        title: qsTr("Второе окно")

        onSignalExit: {            // Обработчик сигнала на открытие первого окна
            secondWindow.close()   // Закрываем второе окно
            mainWindow.show()      // Показываем первое окно
        }
    }
}

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

    Item {
        width: 500
        height: 350
        anchors.horizontalCenter: parent.horizontalCenter
        y: 200
        Flickable {
//               id: flickable
//               clip: true
               interactive: true
                     boundsBehavior: Flickable.StopAtBounds
                     contentHeight: flickme.height
                     contentWidth: flickme.width*1.8
                     width: 360
                     height: 360/3
                     Rectangle {
                         id:flickme
                         color: "yellow"
                         width: 360
                         height: 360/3}
        Flow {
            id: myModel
            anchors.fill: parent
            anchors.margins: 4
            spacing: 10
            Text { text: "Doasdfa sfasdfasdfasdfqafqa"; color: {Qt.rgba(Math.random(),Math.random(),Math.random(),1)} }
            Text { text: "Caawefawfaafqwefawefefqwaaeqwfa"; color: {Qt.rgba(Math.random(),Math.random(),Math.random(),1)} }
            Text { text: "Doasdfa sfasdfasdfasdfqafqa"; color: {Qt.rgba(Math.random(),Math.random(),Math.random(),1)} }
            Text { text: "Caawefawfaafqwefawefefqwaaeqwfa"; color: {Qt.rgba(Math.random(),Math.random(),Math.random(),1)} }
            Text { text: "Doasdfa sfasdfasdfasdfqafqa"; color: {Qt.rgba(Math.random(),Math.random(),Math.random(),1)} }
            Text { text: "Caawefawfaafqwefawefefqwaaeqwfa"; color: {Qt.rgba(Math.random(),Math.random(),Math.random(),1)} }
            Text { text: "Doasdfa sfasdfasdfasdfqafqa"; color: {Qt.rgba(Math.random(),Math.random(),Math.random(),1)} }
            Text { text: "Caawefawfaafqwefawefefqwaaeqwfa"; color: {Qt.rgba(Math.random(),Math.random(),Math.random(),1)} }
        }
        }

        component MyDelegate : Rectangle {
        }

        ListView {
            anchors.fill: parent
            model: myModel

            delegate: MyDelegate {
                color: Qt.rgba(Math.random(),Math.random(),Math.random(),1)

             }
        }
    }
//    Flickable {
//        id: flickable
//        clip: true
//        width: 400
//        height: 300
//        y: 100
//        anchors.horizontalCenter: parent.horizontalCenter

//        Flow {
//            anchors.margins: 10
//            anchors.fill: parent
//            spacing: 10
//}
//        ListModel {
//            id: dataModel
//            dynamicRoles: true              // делмаем типы ролей динамическими
//            Component.onCompleted: {        // первичное монтирование
//                append({ color: "red",text: "Text", })
//                append({ color: "green",text: "Text" })
//                append({ color: "red",text: "Text" })
//                append({ color: "green",text: "Text" })
//                append({ color: "red",text: "Text" })
//                append({ color: "green",text: "Text" })
//                append({ color: "red",text: "Text" })
//                append({ color: "green",text: "Text" })
//                append({ color: "green",text: "Text" })
//                append({ color: "red",text: "Text" })
//                append({ color: "green",text: "Text" })
//                append({ color: "green",text: "Text" })
//                append({ color: "red",text: "Text" })
//                append({ color: "green",text: "Text" })
//            }
//        }

//        Flow {
//            anchors.margins: 10
//            anchors.fill: parent
//            spacing: 10

//            ListView {
//                id: view

//                anchors.margins: 10
//                anchors.fill: parent
//                spacing: 10
//                model: dataModel
//                contentWidth: parent.width
//                contentHeight: parent.height
//                ScrollBar.vertical: ScrollBar { id: vbar; active: hbar.active }

//                delegate: Text {
//                    property var isCurrent: ListView.isCurrentItem
//                   // width: (ListView.isCurrentItem ? 350 : 100)
//                    //height: (ListView.isCurrentItem ? 200 : 100)
//                    font.pixelSize: (ListView.isCurrentItem ? 40 : 20)
//                    color: Qt.rgba(Math.random(),Math.random(),Math.random(),1)
//                    //Text {
//                        text: "Helloy World"

//                    //}

//                        MouseArea {
//                            anchors.fill: parent
//                            onClicked: view.currentIndex = model.index
//                        }
//                }
//            }
//       }

//    }
}

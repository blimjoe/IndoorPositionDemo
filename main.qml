import QtQuick 2.11
import QtQuick.Controls 2.11
import QtQuick.Window 2.11

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("IVY5661 Indoor Position Demo")

    Label {
        id: title_label
        width: parent.width
        height: 30
        text: qsTr("IVY5661 Indoor Position Demo")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 20
        font.bold: true
        anchors.top: parent.top
        anchors.topMargin: 20
    }

    Rectangle {
        id: canvas
        width: 400
        height: 380
        border.color: "grey"
        border.width: 2
        x: 20
        y: 70
    }

    Column {
        id: control_column
        width: 200
        height: 300
        anchors.top: canvas.top
        anchors.topMargin: 15
        anchors.left: canvas.right
        anchors.leftMargin: 20
        spacing: 5

        Label {
            id: ap1label
            text: "AP NO.1:"
            font.bold: true
            font.pixelSize: 20
            color: "black"
        }

        Row {
            id: ap1row
            width: 200
            height: 30
            spacing: 10

            Text {
                text: "x:"
                font.pixelSize: 20
            }
            TextField {
                id: ap1x
                width: 40
                height: 20
                font.pixelSize: 20
            }

            Text {
                text: "y:"
                font.pixelSize: 20
            }
            TextField {
                id: ap1y
                width: 40
                height: 20
                font.pixelSize: 20
            }
        }

        Label {
            id: ap2label
            text: "AP NO.2:"
            font.bold: true
            font.pixelSize: 20
            color: "black"
        }

        Row {
            id: ap2row
            width: 200
            height: 30
            spacing: 10

            Text {
                text: "x:"
                font.pixelSize: 20
            }
            TextField {
                id: ap2x
                width: 40
                height: 20
                font.pixelSize: 20
            }
            Text {
                text: "y:"
                font.pixelSize: 20
            }
            TextField {
                id: ap2y
                width: 40
                height: 20
                font.pixelSize: 20
            }
        }

        Label {
            id: ap3label
            text: "AP NO.3:"
            font.bold: true
            font.pixelSize: 20
            color: "black"
        }

        Row {
            id: ap3row
            width: 200
            height: 30
            spacing: 10

            Text {
                text: "x:"
                font.pixelSize: 20
            }
            TextField {
                id: ap3x
                width: 40
                height: 20
                font.pixelSize: 20
            }
            Text {
                text: "y:"
                font.pixelSize: 20
            }
            TextField {
                id: ap3y
                width: 40
                height: 20
                font.pixelSize: 20
            }
        }

        Label {
            id: ap4label
            text: "AP NO.4:"
            font.bold: true
            font.pixelSize: 20
            color: "black"
        }

        Row {
            id: ap4row
            width: 200
            height: 30
            spacing: 10

            Text {
                text: "x:"
                font.pixelSize: 20
            }
            TextField {
                id: ap4x
                width: 40
                height: 20
                font.pixelSize: 20
            }
            Text {
                text: "y:"
                font.pixelSize: 20
            }
            TextField {
                id: ap4y
                width: 40
                height: 20
                font.pixelSize: 20
            }
        }

        Row {
            width: 200
            height: 30
            spacing: 30

            Button {
                id: runbutton
                width: 60
                height: 30
                background: Rectangle {
                    implicitHeight: parent.height
                    implicitWidth: parent.width
                    color: "mediumseagreen"
                    radius: 10
                }
                Text {
                    text: qsTr("Run")
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    width: parent.width
                    height: parent.height
                    color: "white"
                    font.pixelSize: 20
                }
                onClicked:  {
                    console.log("Start...")
                }
            }

            Button {
                id: stopbutton
                width: 60
                height: 30
                background: Rectangle {
                    implicitHeight: parent.height
                    implicitWidth: parent.width
                    color: "tomato"
                    radius: 10
                }
                Text {
                    text: qsTr("Stop")
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    width: parent.width
                    height: parent.height
                    color: "white"
                    font.pixelSize: 20
                }
                onClicked:  {
                    console.log("Stop...")
                }
            }
        }


    }

    Row {
        id: logo_row
        width: control_column.width
        height: 70
        anchors.bottom: parent.bottom
        anchors.right: parent.right
    }

}

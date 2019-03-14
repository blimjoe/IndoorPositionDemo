import QtQuick 2.11
import QtQuick.Controls 2.0
import QtQuick.Window 2.11
import Process 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("IVY5661 Indoor Position Demo")

    property int x1
    property int x2
    property int x3
    property int x4
    property int xx
    property int y1
    property int y2
    property int y3
    property int y4
    property int yx
    property int apxX: 1
    property int apxY: 2


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

        Rectangle {
            id: ap1
            width: 5
            height: 5
            color: "black"
            visible: false
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 80
            anchors.left: parent.left
            anchors.leftMargin: 80
        }
        Text {
            id: ap1_text
            text: "AP1("+ap1x.text+","+ap1y.text+")"
            font.pixelSize: 10
            font.bold: true
            anchors.left: ap1.right
            anchors.leftMargin: 10
            anchors.top: ap1.top
            visible: false
        }

        Rectangle {
            id: ap2
            width: 5
            height: 5
            color: "black"
            visible: false
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 80
            anchors.right: parent.right
            anchors.rightMargin: 80
        }
        Text {
            id: ap2_text
            text: "AP2("+ap2x.text+","+ap2y.text+")"
            font.pixelSize: 10
            font.bold: true
            anchors.left: ap2.right
            anchors.leftMargin: 10
            anchors.top: ap2.top
            visible: false
        }

        Rectangle {
            id: ap3
            width: 5
            height: 5
            color: "black"
            visible: false
            anchors.left: ap1.left
            anchors.top: parent.top
            anchors.topMargin: 80
        }
        Text {
            id: ap3_text
            text: "AP3("+ap3x.text+","+ap3y.text+")"
            font.pixelSize: 10
            font.bold: true
            anchors.left: ap3.right
            anchors.leftMargin: 10
            anchors.top: ap3.top
            visible: false
        }

        Rectangle {
            id: ap4
            width: 5
            height: 5
            color: "black"
            visible: false
            anchors.left: ap1.left
            anchors.leftMargin: 240/ap2x.text*ap4x.text
            anchors.bottom: ap1.bottom
            anchors.bottomMargin: 220/ap3y.text*ap4y.text
        }
        Text {
            id: ap4_text
            text: "AP4("+ap4x.text+","+ap4y.text+")"
            font.pixelSize: 10
            font.bold: true
            anchors.left: ap4.right
            anchors.leftMargin: 10
            anchors.top: ap4.top
            visible: false
        }

        Rectangle {
            id: apx
            width: 10
            height: 10
            radius: 5
            color: "red"
            visible: false
            anchors.left: ap1.left
            anchors.leftMargin: 240/ap2x.text*apxX
            anchors.bottom: ap1.bottom
            anchors.bottomMargin: 220/ap3y.text*apxY
        }
        Text {
            id: apx_text
            text: "MyPosition("+apxX+","+apxY+")"
            font.pixelSize: 10
            font.bold: true
            anchors.left: apx.right
            anchors.leftMargin: 10
            anchors.top: apx.top
            visible: false
        }
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
                height: 30
                font.pixelSize: 20
            }

            Text {
                text: "y:"
                font.pixelSize: 20
            }
            TextField {
                id: ap1y
                width: 40
                height: 30
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
                height: 30
                font.pixelSize: 20
            }
            Text {
                text: "y:"
                font.pixelSize: 20
            }
            TextField {
                id: ap2y
                width: 40
                height: 30
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
                height: 30
                font.pixelSize: 20
            }
            Text {
                text: "y:"
                font.pixelSize: 20
            }
            TextField {
                id: ap3y
                width: 40
                height: 30
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
                height: 30
                font.pixelSize: 20
            }
            Text {
                text: "y:"
                font.pixelSize: 20
            }
            TextField {
                id: ap4y
                width: 40
                height: 30
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
                    if(ap1x.text.length > 0 && ap1y.text.length > 0 && ap2x.text.length > 0 && ap2y.text.length > 0 && ap3x.text.length > 0 && ap3y.text.length > 0 && ap4x.text.length > 0 && ap4y.text.length > 0) {
                        console.log("input correct")
                        x1 = ap1x.text
                        x2 = ap2x.text
                        x3 = ap3x.text
                        x4 = ap4x.text

                        y1 = ap1y.text
                        y2 = ap2y.text
                        y3 = ap3y.text
                        y4 = ap4y.text
                        var avarageX = (x1 + x2 + x3 + x4)/4
                        ap1.visible = ap2.visible = ap3.visible = ap4.visible = true
                        ap1_text.visible = ap2_text.visible = ap3_text.visible =ap4_text.visible = true

                        if(apxX !== 0 && apxY !== 0){
                            apx.visible = true
                            apx_text.visible = true
                            fake_run.start()
                        }

                    } else {
                        notify_run.start()
                        notify_stop.start()
                    }
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

        Image {
            id: ucr
            width: 65
            height: 65
            source: "images/ucr.png"

        }
        Image {
            id: unisoc
            width: 65
            height: 65
            source: "images/unisoc.png"
        }
        Image {
            id: linaro
            width: 65
            height: 64
            source: "images/96.png"
        }

    }

    Rectangle {
        id: notify
        width: 200
        height: 50
        color: "black"
        anchors.centerIn: parent
        radius: 20
        opacity: 0.7
        visible: false

        Text {
            id: notify_text
            width: parent.width
            height: parent.height
            color: "white"
            font.pixelSize: 20
            text: "ERROR"
            visible: false
        }
    }
    Timer {
        id: notify_run
        interval: 500
        running: false
        onTriggered: {
            notify.visible = true
            notify_text.visible = true
        }
    }
    Timer {
        id: notify_stop
        interval: 2000
        running: false
        onTriggered: {
            notify.visible = false
            notify_text.visible = false
        }
    }
    Timer {
        id: fake_run
        interval:1000
        running: false
        repeat: true
        onTriggered: {
            if(apxX < 7 || apxY < 8){
                apxX ++
                apxY ++
            } else {
                apxX--
                apxY--
            }
        }
    }

}

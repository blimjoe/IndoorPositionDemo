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
        width: 220
        height: 330
        anchors.top: canvas.top
        anchors.left: canvas.right
    }

    Row {
        id: logo_row
        width: control_column.width
        height: 70
        anchors.bottom: parent.bottom
        anchors.right: parent.right
    }

}

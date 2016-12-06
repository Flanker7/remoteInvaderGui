import QtQuick 2.4
import Qt3D.Core 2.0
import QtQuick.Controls 2.0

Item {
    width: 400
    height: 400
    property alias rectangle1: rectangle1
    property alias button1: button1
    Rectangle {
        id: rectangle1
        color: "#ffffff"
        anchors.fill: parent

        Button {
            id: button1
            x: 150
            y: 332
            text: qsTr("Voltar")
        }
    }
}

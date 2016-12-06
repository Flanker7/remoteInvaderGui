import QtQuick 2.4
import QtQuick.Controls 2.0

Item {
    width: 400
    height: 400
    property alias button1: button1
    property alias buttonCreateLayers: buttonCreateLayers
    property alias textField1: textField1
    parent: rectangleframe
    Button {
        id: button1
        x: 224
        y: 129
        width: 71
        height: 40
        text: qsTr("Button")
    }

    Button {
        id: buttonCreateLayers
        x: 307
        y: 129
        width: 64
        height: 40
        //text: qsTr("Button")

    }

    TextField {
        id: textField1
        x: 11
        y: 129
        color: "#000000"
        text: qsTr("Text Field")
    }


}

import QtQuick 2.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0
import QtQuick.Controls.Styles 1.4


Item {
    id:itemframe
    //width: 400
    //height: 400
   // x: rectangleframe.x
    //y:rectangleframe.y
    property alias button1: button1
    property alias comboBox1: comboBox1
    property alias frame1: frame1
    property alias itemframe: itemframe
    //anchors.fill: parent


    Frame {
        id: frame1
        //x:rectangleframe.x
        y:rectangleframe.y
        width:rectangleframe.width
        height:rectangleframe.height
        anchors.fill: parent

        ComboBox {
            id: comboBox1
            x: 30
            y: 28
            width: 162
            height: 36
        }

        Button {
            id: button1
            x: 242
            y: 28
            text: qsTr("Button")
        }
    }
}

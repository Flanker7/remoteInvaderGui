import QtQuick 2.7
import QtQuick.Controls 2.0//1.02.0
import QtQuick.Layouts 1.1
import QtSensors 5.5
import QtQuick.Window 2.2
// This is available in all editors.

ApplicationWindow {
    visible: true
    width: Screen.width//640
    height:Screen.height //480
    title: qsTr("Invader")
    id: rectangle1
    background:ldMain.source="Page1.qml"
   
//    Bubble {
//        id: bubble
//        centerX: rectangle1.width / 2
//        centerY: rectangle1.height / 2
//        bubbleCenter: bubble.width / 2
//        x: bubble.centerX - bubble.bubbleCenter
//        y: bubble.centerY - bubble.bubbleCenter
//    }

//trying to add a swipe menu to main menu
    MouseArea {
            anchors.fill: parent
            onClicked: {
              //  rect.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
            }

    }

    Loader{
            id:ldMain
            anchors.fill: parent;
        }


    Accelerometer {

        id: accel
        dataRate: 100
        active: true
        onReadingChanged: {

            var newX = (bubble.x + calcRoll(accel.reading.x, accel.reading.y, accel.reading.z) * 0.1)
            var newY = (bubble.y - calcPitch(accel.reading.x, accel.reading.y, accel.reading.z) * 0.1)

            if (isNaN(newX) || isNaN(newY))
                return;

            if (newX < 0)
                newX = 0

            if (newX > rectangle1.width - bubble.width)
                newX = rectangle1.width - bubble.width

            if (newY < 18)
                newY = 18

            if (newY > rectangle1.height - bubble.height)
                newY = rectangle1.height - bubble.height

            bubble.x = newX
            bubble.y = newY


        }
    }

    function calcPitch(x, y, z) {
             return -(Math.atan(y / Math.sqrt(x * x + z * z)) * 57.2957795);
         }

    function calcRoll(x, y, z) {
             return -(Math.atan(x / Math.sqrt(y * y + z * z)) * 57.2957795);
         }
    
}

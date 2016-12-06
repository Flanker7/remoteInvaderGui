import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Image {
    id: bubble
    width: 68
    height: 68
    source: "blue-bubble-shiny.png"
    smooth: true
    property real centerX
    property real centerY
    property real bubbleCenter


    Behavior on y {
       SmoothedAnimation {
           easing.type: Easing.Linear
           duration: 100
       }
    }

   Behavior on x {
       SmoothedAnimation {
           easing.type: Easing.Linear
           duration: 100
       }
   }
}

import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtLocation 5.3
import QtQuick.Window 2.2
//import QtWebView 1.1
//import QtWebKit 3.0
import QtWebEngine 1.1
import QtWebChannel 1.0



Item {
    property alias rectangle1: rectangle1
    //property alias button1: button1
    property alias rectangle2: rectangle2
    property alias button2tool: button2tool
    //property alias button3: button3
    property alias rectangle3: rectangle3
    property alias webengineview: webengineview
   // property alias myObject: myObject
    property alias busyIndicator1: busyIndicator1
    property alias buttonmask: buttonmask
    Rectangle {
        id: rectangle1
        color: "#ffffff"
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent
        //signal openFrame
//        Button {
//            id: button1
//            x: 349
//            y: rectangle3.y+rectangle3.height+10
//            text: qsTr("Restart")
//        }
        
        Button {
            id: button2tool
            x: 18
            y: rectangle2.y
            width: rectangle2.height
            height: rectangle2.height
            hoverEnabled:true

            //iconSource: "settings_grey_192x192.png"
             Rectangle{
                 id:buttonmask
                    anchors.fill: parent
                    color: rectangle2.color//"#ffffff"
//                    MouseArea{
//                        anchors.fill: parent
//                        hoverEnabled: true
//                        onHoveredChanged: {
//                           if(containsMouse==true){
//                               buttonmask.opacity = 0.5
//                           }else
//                               buttonmask.opacity = 1;
////                            buttonmask.color="#87CEFA"
//                        }
//                    }
                }

            //Layout.height : 29

           // text: qsTr("|||")
           // background :"settings_grey_192x192.png"
            Image {
               id: settings
               source: "Images/WindowsIcons-master/WindowsPhone/dark/appbar.cog.png"
               anchors.fill:parent
                fillMode: Image.Tile
            }
            z: 2
        }

//        Button {
//            id: button3
//            x: 510
//            y: rectangle3.y+rectangle3.height+10
//            text: qsTr("Maps")
//        }

        Rectangle {
            id: rectangle2
            x: 0
            width: Screen.width
            height: 50
            color: "#2e82b5"
            anchors.top: parent.top
            anchors.topMargin: 0

            Text {
                id: text1
                x: rectangle2.width/2
                y: 9
                width: 126
                height: 32

                text: qsTr("Invader")
                font.bold: true
                font.italic: true
                style: Text.Normal
                font.family: "Verdana"
                transformOrigin: Item.Center
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                font.pixelSize: 21
            }
        }

        Rectangle {
            id: rectangle3
            x: 0//209
            y: rectangle2.height//56
            width: Screen.width-10//Screen.width-rectangle3.x-15
            height: Screen.height-rectangle2.height //Screen.height-rectangle2.height-200//339
            color: "#ffffff"


            BusyIndicator {
                id: busyIndicator1
                x: rectangle3.x+(rectangle3.width/2)//393
                y: rectangle3.y+(rectangle3.height/2)//208
                anchors.centerIn: parent
            }


//            QtObject {
//                id: myObject

//                // the identifier under which this object
//                // will be known on the JavaScript side
//               WebChannel.id: "foo"


//                // signals, methods and properties are
//                // accessible to JavaScript code
//                signal someSignal(string message);


////                function someMethod(message) {
////                    console.log(message);

////                    someSignal(message);
////                    return "foobar";
////                }

//                property string hello: "world"

//            }

               WebEngineView{
                   id: webengineview

                    url:"gmaps.html"//https://maps.googleapis.com/maps/api/js?key=AIzaSyCQxCYUcPRCoZzezua8z0tKdqkk4VkS7cE&callback=initMap"
                    webChannel.registeredObjects: [myObject]

                        //    WebChannel.connectTo: "gmaps.html"
                    //                   WebChannel.registeredObjects: [myObject]
                    anchors.fill: parent

//                    onLoadingChanged:{
//                        if(webengineview.loadProgress==1)
//                         busyIndicator1.running=false
//                        else
//                            busyIndicator1.running=true
//                    }

               }







//            Plugin{
//                id:gmapsplugin
//                name:"googlemaps"

//                PluginParameter { name:"googlemaps.maps.key"; value: "AIzaSyCQxCYUcPRCoZzezua8z0tKdqkk4VkS7cE"}

//                }



//        Map {
//                id: map

////                plugin: Plugin {name:"googlemaps"
////                PluginParameter{name:"googlemaps.maps.apikey"; value: "AIzaSyCQxCYUcPRCoZzezua8z0tKdqkk4VkS7cE"; }
////                PluginParameter { name:  "googlemaps.useragent"; value: "Android"  }

////                }
//                plugin: gmapsplugin
//                anchors.fill:parent
//                center {
//                    latitude: 38.576939
//                    longitude: -9.019568

//                }
//                zoomLevel:  ((maximumZoomLevel - minimumZoomLevel)/2)+7

//                gesture.enabled: true
//            }





}
    }

    }



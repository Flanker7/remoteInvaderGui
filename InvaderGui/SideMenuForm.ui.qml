import QtQuick 2.4
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0
import QtQuick.Controls.Styles 1.4






Item {


//begin-------Definition of global properties------

    property alias rectangleSide: rectangleSide
    id:item2
//    width: 400
//    height: 400
    property alias button2: button2
    property alias button3: button3
    property alias mouseArea1: mouseArea1
    property alias rectanglebutton: rectanglebutton
    property alias flickable1: flickable1
    property alias rectangleframe: rectangleframe
        property alias buttonn2: buttonn2
        property alias buttonside: buttonside
    property alias buttonn2mask: buttonn2mask


//end-------Definition of global properties------

    z:1
    //    MouseArea{ anchors.fill:parent
    //    //drag.target: rectangleSide
    //    cursorShape:Qt.ArrowCursor
    //}

    //    FileDialog {

    //        id: fDialog
    //        title: "Please choose a file"
    //        folder: shortcuts.home
    //        nameFilters: [ "Xml files (*.xml)", "All files (*)" ]
    //        onAccepted:{
    //           Zeca.output1()
    //            //console.log("You chose: " + fileDialog.fileUrls)
    //        }//Qt.quit()

    //        onRejected:{
    //            outputx.output2()
    //            //console.log("Canceled")
    //            //Qt.quit()
    //        }
    //        Component.onCompleted: visible = false
    //    }

    Rectangle {
        id: rectangleSide
        x: 0
        y:  rectangle3.y+1//0
        z:1
        width: rectangle3.width/4
        height: rectangle3.height
        color: "#F0F8FF"
        //        Component.onCompleted:
        //        {  // console.log("ainda vem")
        ////            rectangle3.x=rectangleSide.width
        ////            rectangle3.width=rectangle3.width-rectangleSide.width
        //       }
        MouseArea{
            id: mouseArea1
            anchors.fill:parent
            //drag.target: rectangleSide
            cursorShape: Qt.ArrowCursor

        }

        Rectangle{
            id:rectanglebutton
            x: 0
            y: rectangle2.y+rectangle2.height
            width: rectangle3.width/4
            height:buttonn2.y+ buttonn2.height+24
            border.color:"#D3D3D3"



        Flickable {
            id: flickable1
            boundsBehavior: Flickable.StopAtBounds
            flickableDirection: Flickable.HorizontalFlick
           anchors.fill: parent


            contentWidth: 1200

           Button{
                id: buttonn2
                x: 10
                y: 24
                //height: rectanglebutton.height
                width: 75
                hoverEnabled:true
                //text: qsTr("Button")
                Rectangle{
                    id:buttonn2mask
                    anchors.fill: parent
                    color: "#ffffff"
                }

                visible: true

                Image {
                   id: home
                   source:"Images/WindowsIcons-master/WindowsPhone/light/appbar.home.empty.png"
                   anchors.fill:parent
                   fillMode: Image.Tile//PreserveAspectFit

             }
            }

            Button {
                id: buttonside
                x: 104
                y: 24
                width: 75
                hoverEnabled:true
                // z:2
               // text: qsTr("Button2")
                Rectangle{
                    anchors.fill: parent
                    color: "#ffffff"
                }
                Image {
                   id: uploadorthophoto
                   source:"Images/WindowsIcons-master/WindowsPhone/light/appbar.cloud.upload.png"
                   anchors.fill:parent
                   fillMode: Image.Tile//PreserveAspectFit

             }





            }

            Button {
                id: button2
                x: 198
                y: 24
                width: 75
                hoverEnabled:true
                //text: qsTr("Button")
                Rectangle{
                    anchors.fill: parent
                    color: "#ffffff"
                }
                Image {
                   id: layers
                   source:"Images/WindowsIcons-master/WindowsPhone/light/appbar.layer.png"
                   anchors.fill:parent
                   fillMode: Image.Tile//PreserveAspectFit

             }
            }

            Button {
                id: button3
                x: 300
                y: 24
                width: 75
                hoverEnabled:true
                //text: qsTr("Button")
                Rectangle{
                    anchors.fill: parent
                    color: "#ffffff"
                }

                Image {
                    id: addlayers
                    source:"Images/WindowsIcons-master/WindowsPhone/light/appbar.layer.add.png"
                    anchors.fill:parent
                    fillMode: Image.Tile//PreserveAspectFit

             }
//                Text {
//                            id: buttontext
//                            anchors.left: parent.left
//                            anchors.right: parent.right
//                            anchors.top: parent.bottom
//                            anchors.centerIn: parent.Center
//                            font.bold: true
//                            text: "Add Layer"

//                        }

            }
        }
        
        }
        Rectangle {
            id: rectangleframe
            x: 0
            y: rectanglebutton.y+rectanglebutton.height+10
            z:1
            width: rectanglebutton.width
            height: 400//rectangleSide.height-rectangleframe.y
            color: "#ffffff"




        }
    }











}


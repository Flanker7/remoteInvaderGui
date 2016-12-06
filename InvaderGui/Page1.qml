import QtQuick 2.7
import QtQuick.Window 2.0
import QtWebEngine 1.1
import QtWebChannel 1.0
//Page1Form {
//    button1.onClicked: {
//        console.log("Button Pressed. Entered text: " + textField1.text);
//    }
//}
import QtQuick.Controls 1.4

Page1Form {
    property alias myObject: myObject
    property int  check: 0

    Loader{
        id:ldPage1;
        anchors.fill: parent;

//            Button {
//                id: button1
//                x: 365
//                y: 253
//                text: "Maps"
//            }
        }



//    button1.onClicked: {
//        // aBool: true
//        accel.active=false
//        console.log("antes:"+bubble.centerX);
//        console.log("antes:"+bubble.centerY);
//        console.log("antes:"+bubble.bubbleCenter);
//        console.log("antes:"+bubble.x);
//        console.log("antes:"+bubble.y);
//        //           bubble.centerX = rectangle1.width / 2
//        //           bubble.centerY = 0
//        //            bubble.bubbleCenter = bubble.width / 2
//        bubble.x = rectangle1.width / 2
//        bubble.y = 0
//        console.log("depois:"+bubble.centerX);
//        console.log("depois:"+bubble.centerY);
//        console.log("depois:"+bubble.bubbleCenter);
//        console.log("depois:"+bubble.x);
//        console.log("depois:"+bubble.y);
//        //console.log("a clicar no botao1");
//        console.log(Qt.platform.os)
//        if(Qt.platform.os=="windows")
//        {
//            console.log("nao funco")
//        }
//        else
//        {
//            if(Qt.platform.os=="android")
//            {
//                console.log("ja funco")
//                accel.active=true
//            }
//        }
//       ldPage1.source="Page2.qml";
//       //ldPage1.source="qrc:/SideMenuForm.ui.qml"

//    }
    button2tool.onHoveredChanged: {

                                   if(button2tool.hovered==true){
                                       buttonmask.opacity = 0.5
                                   }else
                                       buttonmask.opacity = 1;
        //                            buttonmask.color="#87CEFA"

    }

    button2tool.onClicked: {
        if(check==0){

        ldPage1.source="qrc:/SideMenu.qml"

       // button2.openFrame()



            //button2.parent=SideMenuForm.flickable1
            button2tool.z=100
            check=1;
        }else{
                if(check==1){
                    //ldPage1.source="Page1.qml"
                    ldPage1.source =""
//                    rectangle3.width=Screen.width-10
//                    rectangle3.x=0
                   //ldPage1.item.destroy()
                    check=0
                }
        }

    }

//    webengineview.onLoadingChanged:{
//                            if(webengineview.loadProgress==1)
//                             busyIndicator1.running=false
//                            else
//                                busyIndicator1.running=true
//                        }

//    button3.onClicked:{
//        ldPage1.source="MapPageForm.ui.qml"

//    console.log("devia ir para mapa")
//    }


    QtObject {
        id: myObject

        // the identifier under which this object
        // will be known on the JavaScript side
       WebChannel.id: "foo"

         // signals, methods and properties are
        // accessible to JavaScript code
        signal someSignal(var coordinates, var layersJson);

           // signal some2 (variant coordinates);
        onSomeSignal: console.log(JSON.stringify( webengineview.webChannel.registeredObjects))

//               function someMethod(coordinates)
//               {
//                   return coordinates
//               }

//                    //console.log(message);

//                    someSignal(message);
//                    return "foobar";
//                }

        property string hello: "world"


}






}

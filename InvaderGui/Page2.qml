import QtQuick 2.4

Page2Form {


    Loader{
            id:ldPage2;
            anchors.fill: parent;
        }

    anchors.fill: parent
    Bubble {
                 id: bubble2
                 centerX: rectangle1.width / 2
                 centerY: rectangle1.height / 2
                 bubbleCenter: bubble.width / 2
                 x: bubble.centerX - bubble.bubbleCenter
                 y: bubble.centerY - bubble.bubbleCenter
                }

   button1.onClicked: {
       // aBool: true
        accel.active=false
        console.log("antes:"+bubble.centerX);
        console.log("antes:"+bubble.centerY);
        console.log("antes:"+bubble.bubbleCenter);
        console.log("antes:"+bubble.x);
        console.log("antes:"+bubble.y);
//           bubble.centerX = rectangle1.width / 2
//           bubble.centerY = 0
//            bubble.bubbleCenter = bubble.width / 2
       bubble.x = rectangle1.width / 2
       bubble.y = 0
        console.log("depois:"+bubble.centerX);
        console.log("depois:"+bubble.centerY);
        console.log("depois:"+bubble.bubbleCenter);
        console.log("depois:"+bubble.x);
        console.log("depois:"+bubble.y);
        //console.log("a clicar no botao1");
        console.log(Qt.platform.os)
        if(Qt.platform.os=="windows")
        {
            console.log("nao funco2")
        }
        else
        {
            if(Qt.platform.os=="android")
            {
                console.log("ja funco")
                accel.active=true
            }
        }
            //ldPage2.source="Page1.qml";
    }



}

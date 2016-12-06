import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.0
import QtLocation 5.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.0
import "qrc:/output.js" as Js
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0
import QtQuick.Controls.Styles 1.4
import Qt.WebSockets 1.0



SideMenuForm {



//parent:Page1Form
    property var coordenates
 property alias ldPageSideMenu:ldPageSideMenu

    Loader{
        id:ldPageSideMenu;
       z:3
//       x: rectangleframe.x
//        y:rectangleframe.y
//       width: rectangleframe.width
//       height: rectangleframe.height
        parent: rectangleframe
        anchors.fill: parent
        source:"SideMenuHome.qml"

        }


//    Connections {
//        target:button2tool
//        onClicked:console.log("clicou butanito")//{ldPageSideMenu.source="SideMenu2.qml"}
//    }





    button3.onClicked: {
        //fDialog.open()
        ldPageSideMenu.source=""
        ldPageSideMenu.source="LoadCoordinatesMenu.qml"

}

    button2.onClicked: {
        console.log(rectangleframe.y);
        console.log(ldPageSideMenu.parent)
        //console.log(frame1.parent)





}
//    buttonn2 {
//       // height: rectanglebutton.height
//       // width: rectanglebutton.width/4


//    }

    buttonn2.onClicked: {
        ldPageSideMenu.source=""
        ldPageSideMenu.source="SideMenuHome.qml"
        //console.log("devia");
}
    buttonn2.onHoveredChanged: {
        if(buttonn2.hovered==true)
        {
            buttonn2mask.color="#F0F8FF"
        }else
            buttonn2mask.color="#ffffff"
    }

    buttonside.onClicked: {

        ldPageSideMenu.source="SideMenu2.qml"
       // frame1.y=rectangleframe.y

}














}

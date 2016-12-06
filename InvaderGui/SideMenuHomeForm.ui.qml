import QtQuick 2.7
import QtQuick.Controls.Universal 2.0
import QtQuick.Controls 2.0
import QtQuick.LocalStorage 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtTest 1.1
import QtQuick.Controls.Material 2.0
import QtQuick.Window 2.2
import QtQuick.LocalStorage 2.0
import QtQml.Models 2.1


Item {
    property alias treeview: treeview
    property alias buttonsideHome: buttonsideHome
    property alias mymodel: mymodel


    Frame{
    id:frame2
    anchors.fill:parent

    /*
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

      */


    ListModel{
        id:mymodel


        }


    TreeView {
        id:treeview
        anchors.fill:parent

        TableViewColumn {
            title: "Project Name"
            role: "ProjectName"
            width: 300

        }
        TableViewColumn {
            title: "Date"
            role: "date"
            width: treeview.width-300//rectangleframe.width-20-310
        }
        model: mymodel


    }



}
    Button {
        parent: rectangleSide
        id: buttonsideHome
        x: treeview.x//rectangleframe.x+rectangleframe.width-buttonsideHome.width-1//135
        y: rectangleframe.y+rectangleframe.height//213
        width: 75
        height:75
        //text: qsTr("Button")
        //hoverEnabled:true
//        Rectangle{
//            anchors.fill: parent
//            color: "#F0F8FF"//"#ffffff"
//        }
        Image {
           id: pageadd
           source:"Images/WindowsIcons-master/WindowsPhone/light/appbar.page.add.png"
           anchors.fill:parent
           fillMode: Image.Tile//PreserveAspectFit

     }

    }
}



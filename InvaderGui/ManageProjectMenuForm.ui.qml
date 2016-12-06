import QtQuick 2.7
import QtQuick.Controls.Material 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Universal 2.0
import QtQuick.LocalStorage 2.0
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3
import QtQuick.Templates 2.0
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.0
import "."

Item {
    width: 400
    height: 400
    parent: rectangleframe
    property alias label1: label1
    property alias listEditProject: listEditProject


 Rectangle{
     parent: rectangleframe
     id:rectlabel
     anchors.top: parent.top

     x:rectangleframe.x
     width: rectangleframe.width
     height:label1.height
    radius: 5
    border.color: "grey"
     Label{

        id:label1
        parent: rectlabel
        font.pixelSize: 32
            font.italic: true
            color: "steelblue"
//            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

        //text:SideMenuHomeSingleton.treeviewIndex
    }
}

 Rectangle{
     parent: rectangleframe
     id:rectlist
     anchors.top: rectlabel.bottom

     x:rectlabel.x
     width: rectangleframe.width
     height:rectangleframe.height-rectlabel.height
    radius: 5
    border.color: "grey"
    ListView{
        parent: rectlist
        id:listEditProject
        anchors.top:rectlist.top
        width: rectangleframe.width
        height: rectlist.height//rectangleframe.height-rectlabel.height-10
        clip: true
    flickableDirection: Flickable.VerticalFlick
        y:rectlist.y+4

        //anchors.fill:parent
        //anchors.top: label1.Bottom

        model: listEditProjectModel
       // flickableDirection: Flickable.VerticalFlick
        boundsBehavior :Flickable.StopAtBounds
//        contentHeight: 1200
       // snapMode: ListView.NoSnap


         //spacing: 4
        //delegate: listSpeciesElement
        delegate: listSpeciesElement /*Row{

            Rectangle{
                        id:rect1

                        //y: label1.bottom
                           width: 75
                           height: 75
                           color: AreaColor//"grey" //listEditProject.model.color
                              radius: 5
                              opacity: 0.7

                       }
                       Text {

                        text: Species
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                       }

}*/
}


}

}

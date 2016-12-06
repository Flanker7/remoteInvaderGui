import QtQuick 2.7
import QtQuick.Controls.Material 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Universal 2.0
import QtQuick.LocalStorage 2.0
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3
import QtQuick.Templates 2.0
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQml.Models 2.1
import QtQuick.Controls 1.4
import "."

ManageProjectMenuForm {

    property int listIndex
    ColorDialog {
        width: 400
        height:400
        id: colorDialog
        title: "Please choose a color"
        onAccepted: {

            console.log("You chose: " + colorDialog.color)
           // console.log(listEditProject.indexAt(0,1))
            listEditProjectModel.setProperty(listIndex, "AreaColor", colorDialog.color.toString())
        }
        onRejected: {
            console.log("Canceled")
            //Qt.quit()
        }
        Component.onCompleted: visible = false
    }

label1.text: GlobalVariables.treeviewIndex

 Component{
     id:listSpeciesElement

     Row{
        id:row1
         Rectangle{
                     id:rect1
                        width: 75
                        height: 75
                        color: AreaColor//"grey" //listEditProject.model.color
                        radius: 5
                        opacity: 0.7
                        MouseArea{
                            anchors.fill:parent
                            onClicked:{
                                listIndex=Index
                                colorDialog.open();
                                //listEditProjectModel.setProperty(0, "AreaColor", "black")
                                //listEditProjectModel.get(0).AreaColor
                                //console.log(listEditProjectModel.get(0).AreaColor )
                            }
                        }
                    }
         Rectangle{
                id:rect2
             //anchors.left: rect1.right
            width: rectangleframe.width-(rect1.x+rect1.width)
            height: rect1.height
//            color: AreaColor
//            radius:5
//            opacity:0.2
            MouseArea{
                //check why it isn't reacting to mouse events
                anchors.fill:parent
                onDoubleClicked:{
                     speciesedit.visible=true;
                       speciesedit.selectAll();
                        speciesedit.forceActiveFocus();
//                    species.selectByMouse=true
//                    species.readOnly=false;
//                    species.selectAll();

                    //editSpecies.open()
                    //listEditProjectModel.setProperty(0, "AreaColor", "black")
                    //listEditProjectModel.get(0).AreaColor
                    console.log(listEditProjectModel.get(listIndex).Species )
                }
            }

                    Text {
                        id:species
                       anchors.fill:parent
                     text: Species
                     font.pixelSize: 18
//                    selectByMouse: true
//                    readOnly: true
                     horizontalAlignment: Text.AlignHCenter
                     verticalAlignment: Text.AlignVCenter

                    }
                    TextArea{
                        id:speciesedit
                        anchors.fill:parent
                        text: Species
                        font.pixelSize: 18
                        selectByMouse: true
                        //readOnly: true
                        horizontalAlignment: Text.AlignHCenter
                         verticalAlignment: Text.AlignVCenter
                        visible: false
                        Button{
                            id:accept
                            anchors.right:speciesedit.right
                           // anchors.verticalCenter: speciesedit.verticalCenter
                            anchors.bottom: speciesedit.bottom
                            width: 45
                            Image {

                                anchors.fill:parent
                                source: "Images/WindowsIcons-master/WindowsPhone/light/appbar.check.png"
                                fillMode: Image.Tile
                            }
                            onClicked: {
                                listIndex=Index
                                listEditProjectModel.setProperty(listIndex, "Species", speciesedit.text)
                                speciesedit.visible=false;
                                //Add change in bd and possibly add a text sugestion in textarea with species
                            }
                        }
                        Button{
                            id:decline
                            anchors.right:accept.left
                           // anchors.verticalCenter: speciesedit.verticalCenter
                            anchors.bottom: speciesedit.bottom
                            width: 45
                            Image {

                                anchors.fill:parent
                                source: "Images/WindowsIcons-master/WindowsPhone/light/appbar.close.png"
                                fillMode: Image.Tile
                            }
                            onClicked: {
                                listIndex=Index
                                speciesedit.text=species.text
                                speciesedit.visible=false;
                            }
                        }
                }



         }
    }
}
 ListModel{
     id:listEditProjectModel

     ListElement {
            Index:0
            AreaColor: "yellow"
            Species: "Acácia"
        }
        ListElement {
            Index:1
            AreaColor: "green"
            Species: "Pinheiro"
        }
        ListElement {
            Index:2
            AreaColor: "red"
            Species: "Eucalipto"
        }
        ListElement {
               Index:3
               AreaColor: "black"
               Species: "Canas das pampas"
           }
           ListElement {
               Index:4
               AreaColor: "blue"
               Species: "Carvalho"
           }
           ListElement {
               Index:5
               AreaColor: "pink"
               Species: "Cactos"
           }
           ListElement {
                  Index:6
                  AreaColor: "brown"
                  Species: "Ervas daninhas"
              }
              ListElement {
                  Index:7
                  AreaColor: "grey"
                  Species: "Canas da América do sul"
              }
              ListElement {
                  Index:8
                  AreaColor: "white"
                  Species: "Magnólias"
              }


 }




}

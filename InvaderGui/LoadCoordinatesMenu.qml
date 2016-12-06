import QtQuick 2.4
import QtQuick.Dialogs 1.0
import "xml2jsobj.js" as Xml2json
import QtWebEngine 1.1
import QtWebChannel 1.0
import QtQml 2.2

LoadCoordinatesMenuForm {
    property var coordinates
    property var layersJson:new Array
  //  property alias coordinateshtml: coordinateshtml
    Component.onCompleted: {
        textField1.selectAll()
    }

    textField1.text: "File Url"

    buttonCreateLayers.text: "Create area layers"
    buttonCreateLayers.visible: false

    FileDialog {

            id: fDialog
            title: "Please choose a file"
            folder: shortcuts.home
            nameFilters: [ "Xml files (*.xml)", "All files (*)" ]
            onAccepted:{
               //Js.output1()
                //console.log("You chose: " + fDialog.fileUrl)
                textField1.text=fDialog.fileUrl
                buttonCreateLayers.visible=true
                var xhr = new XMLHttpRequest;
                xhr.open("GET", fDialog.fileUrl);
                //console.log(a.stringify())
                xhr.onreadystatechange = function() {
                if (xhr.readyState == XMLHttpRequest.DONE) {
                coordinates = Xml2json.XML2jsobj(xhr.responseXML.documentElement);
                    //console.log(JSON.stringify(coordinates))

//
                }
                }
                xhr.send();



            }//Qt.quit()

            onRejected:{
                //Js.output2()
                //console.log("Canceled")
                //Qt.quit()
            }
            Component.onCompleted: visible = false
        }

    button1.text:"Upload Coordinates"
    button1.onClicked: {


        fDialog.open()

    }





  buttonCreateLayers.onClicked: {

      for(var i =0; i<coordinates.class[0].rect.length; i++){

      loadAreaLayers1(coordinates.class[0].rect[i].X,coordinates.class[0].rect[i].Y)
      console.log(JSON.stringify(layersJson))
      }

        console.log(JSON.stringify(layersJson))

    myObject.someSignal(coordinates,layersJson)

 }



function loadAreaLayers1(newX,newY){
    var patch_size= coordinates.parameters.patch_size
    // retrieve the lat lng for the far extremities of the (visible) map
    var lat = coordinates.geographic_info.ref_latitude
     var lon = coordinates.geographic_info.ref_longitude
     var centerX= coordinates.image_properties.source_width/2
    var centerY=coordinates.image_properties.source_heigth/2
    var dn
    var de
     //Earth’s radius, sphere
     var R= 6378137
    console.log(lat+" "+lon);
    console.log(R);

    //needs center of window
     //offsets in meters
    //in case that x>center and y >center
//    if( newX > centerX && newY > centerY ){
    //lat
     dn =((centerY-newY)/patch_size)*(patch_size*coordinates.geographic_info.cm_per_1px_ratio/100)
    //long
     de =((newX-centerX)/patch_size)*(patch_size*coordinates.geographic_info.cm_per_1px_ratio/100)
//    }
//    else if(newX > centerX && centerY > newY ){
//        //lat
//         dn =((centerY-newY)/patch_size)*(patch_size*coordinates.geographic_info.cm_per_1px_ratio/100)
//        //long
//         de =((newX-centerX)/patch_size)*(patch_size*coordinates.geographic_info.cm_per_1px_ratio/100)
//        }else if(  centerX > newX  && newY > centerY ){
//        //lat
//         dn =((centerY-newY)/patch_size)*(patch_size*coordinates.geographic_info.cm_per_1px_ratio/100)
//        //long
//         de =((newX-centerX)/patch_size)*(patch_size*coordinates.geographic_info.cm_per_1px_ratio/100)
//        }
//        else if(centerX > newX && centerY > newY ){
//            //lat
//             dn =((centerY-newY)/patch_size)*(patch_size*coordinates.geographic_info.cm_per_1px_ratio/100)
//            //long
//             de =((newX-centerX)/patch_size)*(patch_size*coordinates.geographic_info.cm_per_1px_ratio/100)
//            }

    console.log(dn+" "+de);

     //Coordinate offsets in radians
     var dLat = dn/R
      var dLon = de/(R*Math.cos(Math.PI*lat/180))
    console.log(dLat+" "+dLon);

     //OffsetPosition, decimal degrees
     var latO = +lat + +(dLat * 180/Math.PI)
     var lonO = +lon + +(dLon * 180/Math.PI)
     console.log(dLat * 180/Math.PI+" "+dLon * 180/Math.PI);
    console.log(latO+" "+lonO);
     layersJson.push({lat:latO, lng:lonO});
    //layersJson.push(lonO);

}
}

//pragma Singleton
import QtQuick 2.4
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
import QtQuick.Dialogs 1.2
import "."

SideMenuHomeForm {

parent:rectangleframe
property var db: null
property string res: ""
property var arrOut : new Array
property var uuid
property var treeviewIndex

BusyIndicator {
    id: bi1
    parent: rectangleframe
    //anchors.centerIn: rectangleframe
    //running: true
}


buttonsideHome.onClicked: {
    uuid = guid();
    newprojectdialog.open();
    edtInput.selectAll();
    edtInput.forceActiveFocus();
    //edtInput.cursorPosition=edtInput.selectionEnd;


}

//--Function to Generate GUID
function guid() {
  function s4() {
    return Math.floor((1 + Math.random()) * 0x10000)
      .toString(16)
      .substring(1);
  }
  return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
    s4() + '-' + s4() + s4() + s4();
}

//---function to open connection to DB
function openDb(){
    if(db !== null) return;

            // db = LocalStorage.openDatabaseSync(identifier, version, description, estimated_size, callback(db))
            db = LocalStorage.openDatabaseSync("example-app", "0.1", "Simple example app", 100000);

            try {
                db.transaction(function(tx){
                    tx.executeSql('CREATE TABLE IF NOT EXISTS settings(ProjectNumber INTEGER  UNIQUE PRIMARY KEY ASC AUTOINCREMENT
                    NOT NULL, guid VARCHAR UNIQUE NOT NULL, projectname VARCHAR NOT NULL, Date DATETIME DEFAULT (CURRENT_TIMESTAMP)
                    NOT NULL, DeletedFlag BOOLEAN NOT NULL DEFAULT false)');
                    var table  = tx.executeSql("SELECT * FROM settings");
                    // Seed the table with default values
                    if (table.rows.length == 0) {
//                        tx.executeSql('INSERT INTO settings VALUES(?, ?)', ["distro", "Ubuntu"]);
//                        tx.executeSql('INSERT INTO settings VALUES(?, ?)', ["foo", "Bar"]);
                        console.log('Settings table added');
                    };
                });
            } catch (err) {
                console.log("Error creating table in database: " + err);
            };

}
//---Function add new element to settings table
function saveNewRow(guid, projectName) {
        openDb();
        db.transaction( function(tx){
           // tx.executeSql('INSERT INTO settings VALUES(?,Guid,ProjectName,?,?)', [guid, projectName]);
            tx.executeSql("INSERT INTO settings(guid, projectname) VALUES('"+guid+"','"+projectName+"');");
        });
    }
//--function to delete element from setting table using guid as key
function deleteRow(guid){
    openDb();
    db.transaction( function(tx){
       // tx.executeSql('INSERT INTO settings VALUES(?,Guid,ProjectName,?,?)', [guid, projectName]);
        tx.executeSql("UPDATE settings SET DeletedFlag='true' WHERE Guid='"+guid+"';");
    });

}

//---Function to query all active Projects from settings table
function loadProject() {
    openDb();
    db.transaction( function(tx){
        var rs=tx.executeSql("SELECT * FROM settings WHERE DeletedFlag='false' order by Date desc");

        for(var i = 0; i < rs.rows.length; i++) {
                       arrOut.push(rs.rows.item(i))
                   }
        return arrOut
    });

}
//--Function to populate or update projects table
function loadTreeView()
{
    mymodel.clear();
    arrOut=[]
    loadProject();
    for(var i = 0; i < arrOut.length; i++) {
        mymodel.append({'ProjectName':arrOut[i].projectname,'date':arrOut[i].Date})
}
}

Dialog {
    id:newprojectdialog
    visible: false
    height: 200
    width: 400
    title: "Add New Project"
    Frame {
        id:dialogFrame
                anchors.fill:parent
                Text {
                    id:text4
                   // anchors.verticalCenter:parent.verticalCenter/2//dialogFrame.y+(dialogFrame.height/3)
                    //anchors.centerIn: parent
                    anchors.horizontalCenter:parent.horizontalCenter
                    text: "Create a new project?"
                }

                Text {
                    id:text2
                    //y:dialogFrame.y+(dialogFrame.height/2)
                    anchors.verticalCenter:parent.verticalCenter
                    text: "Insert a new project Name:"
                }
//                Rectangle{
//                    x: text2.x+text2.width+10
//                    //y:parent.y+(parent.height/2)
//                    anchors.verticalCenter:parent.verticalCenter
//                    height:text2.height*1.25
//                    width: text2.width
//                    border.color:"#808080"

                TextArea {
                    id: edtInput
                    text: "(Project Name)"
                    x: text2.x+text2.width+10
                    //y:parent.y+(parent.height/2)
                    anchors.verticalCenter:parent.verticalCenter
                    height:text2.height*1.75
                    width: text2.width
                    verticalScrollBarPolicy:Qt.ScrollBarAlwaysOff
                    wrapMode: TextInput.WrapAtWordBoundaryOrAnywhere
//                    anchors.fill: parent
//                anchors.centerIn: parent
//                }
                }
            }

    standardButtons: StandardButton.Yes |StandardButton.No
    onYes: {
        saveNewRow(uuid,edtInput.text);
        mymodel.clear();
        arrOut=[]
       loadTreeView();
        edtInput.text="(Project Name)"
        //1-needs to load second menu(menu2 to send orthophotomap to algorithm)
        //2-needs to be able to edit a project in order to send an orthophotomap, or to upoload a XMLHttpRequest
        // or to edit the google maps information

    }

}

treeview.onClicked:{
    deleteProjectButton.enabled=true;
    deleteProjectButton.checkable=false;
    deleteProjectButton.checked=false;
    editProjectButton.enabled=true;
    editProjectButton.checkable=false;
    editProjectButton.checked=false;
}

Button{
    parent: rectangleSide
    id:deleteProjectButton
    height:buttonsideHome.height
    width:buttonsideHome.width
    x:buttonsideHome.x+buttonsideHome.width
    y:rectangleframe.y+rectangleframe.height
    checkable:true
    checked: true
    enabled: false
//    text:"delete"
//    Rectangle{
//        anchors.fill: parent
//        color: "#F0F8FF"//"#ffffff"
//    }
    Image {
       id: pageremove
       source:"Images/WindowsIcons-master/WindowsPhone/light/appbar.page.delete.png"
       anchors.fill:parent
       fillMode: Image.Tile//PreserveAspectFit

 }
    onClicked: {
        //fazer o delete da treelist fazer o delete da bd e fazer o refresh(nnovo load ) da treelist
        //console.log(arrOut[treeview.currentIndex.row].guid);
          deleteRow((arrOut[treeview.currentIndex.row].guid))
            loadTreeView();
    }
}


Button{
    parent: rectangleSide
    id:editProjectButton
    height:buttonsideHome.height
    width:buttonsideHome.width
    x:deleteProjectButton.x+deleteProjectButton.width
    y:rectangleframe.y+rectangleframe.height
    checkable:true
    checked: true
    enabled: false


//    text:"delete"
//    Rectangle{
//        anchors.fill: parent
//        color: "#F0F8FF"//"#ffffff"
//    }
    Image {
       id: pageedit
       source:"Images/WindowsIcons-master/WindowsPhone/light/appbar.page.edit.png"
       anchors.fill:parent
       fillMode: Image.Tile//PreserveAspectFit

 }
    onClicked: {
        GlobalVariables.treeviewIndex=arrOut[treeview.currentIndex.row].projectname
        ldPageSideMenu.setSource("")
        ldPageSideMenu.setSource("ManageProjectMenu.qml")
    }
}


treeview.onDoubleClicked: {
    //button3.clicked()//working well :) use to load manageproject menu
    GlobalVariables.treeviewIndex=arrOut[treeview.currentIndex.row].projectname
    ldPageSideMenu.setSource("")
    ldPageSideMenu.setSource("ManageProjectMenu.qml")
}


Component.onCompleted:{
     loadTreeView();
    bi1.running=false;
    }










}

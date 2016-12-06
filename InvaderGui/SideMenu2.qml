import QtQuick 2.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.1
SideMenu2Form {

parent: rectangleframe


        comboBox1{
            currentIndex: 0
            width: 200
            model: ["Simple Image", "Multiple Image", "Ortophoto"]
            }

        MessageDialog {
            id: messageDialog
            title: "Attention Please!!"
            //text: "It's so cool that you are using Qt Quick."
            onAccepted: {
//                console.log("And of course you could only agree.")
//                Qt.quit()
                //console.log(superawesome)
                messageDialog.close()
            }
            Component.onCompleted: visible = false
        }


    button1.onClicked: {

        if(comboBox1.currentIndex==0)
        {
            messageDialog.text=comboBox1.currentText
            messageDialog.open()
        }else if(comboBox1.currentIndex==1)
        {
            messageDialog.text=comboBox1.currentText
            messageDialog.open()
        }else if(comboBox1.currentIndex==2)
        {
            messageDialog.text=comboBox1.currentText
            messageDialog.open()
        }


    }



}

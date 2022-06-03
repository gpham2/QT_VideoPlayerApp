import QtQuick 2.0
import QtQuick.Dialogs
import QtQuick.Layouts
import QtMultimedia
import QtQuick.Window 2.15


Item {
    id: root
    required property MediaPlayer mediaPlayer
    required property VideoOutput videoOutput

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        onAccepted: {
            mediaPlayer.stop()
            mediaPlayer.source = fileDialog.currentFile
            play()
        }
    }

    function play() {
        mediaPlayer.play()
    }

    function promptDialog () {
        mediaPlayer.stop();
        fileDialog.open()
    }


    RowLayout {
        anchors.fill: parent
        id: rowFile

        ButtonComp {
            id: fileBtn
            Layout.preferredWidth: Screen.height/5
            Layout.preferredHeight: Screen.height/15.7
            onClicked: promptDialog()
            baseColor: "orange"
            displayText: "Open"
            textSize: Screen.height/32
            changeColor: false
        }

//        RoundButton {
//            id: fileBtn
//            //Layout.preferredWidth: Screen.width/3.5
//            //Layout.preferredHeight: Screen.width/10
//            Layout.preferredWidth: Screen.height/5
//            Layout.preferredHeight: Screen.height/15.7
//            onClicked: promptDialog()
//            background: Rectangle {
//                    color: "orange"
//                    radius: 300
//            }
//            Text {
//                text: "Open"
//                color: "white"
//                font.family: "Helvetica"
//                font.bold: true
//                font.pointSize: Screen.height/32
//                //font.pointSize: 40
//                anchors.verticalCenter: parent.verticalCenter
//                anchors.horizontalCenter: parent.horizontalCenter
//            }
//        }


    }
}

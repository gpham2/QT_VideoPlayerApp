import QtQuick 2.0
import QtQuick.Layouts
import QtMultimedia
import QtQuick.Window 2.15
import ChooseFile 1.0
Item {
    id: root
    required property MediaPlayer mediaPlayer
    required property VideoOutput videoOutput


    ChooseFile{
        id: chooseFile


    }

//    FileDialog {
//        id: fileDialog
//        title: "Please choose a file"
//        onAccepted: {
//            mediaPlayer.stop()
//            mediaPlayer.source = fileDialog.currentFile
//            console.log(mediaPlayer.source)
//            play()
//        }
//    }

    function play() {
        mediaPlayer.play()
    }

    function promptDialog () {
        mediaPlayer.stop();
        //fileDialog.open()
        chooseFile.setMyFile("abc");
        //console.log(chooseFile.testFile());
        mediaPlayer.source = chooseFile.readFile();
        play()



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

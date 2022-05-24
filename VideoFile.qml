import QtQuick 2.0
import QtQuick.Controls
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
        RoundButton {
            id: fileBtn
            Layout.preferredWidth: Screen.width/3.5
            Layout.preferredHeight: Screen.width/10
            onClicked: promptDialog()
            background: Rectangle {
                    color: "orange"
                    radius: 300
            }
            Text {
                text: "Open"
                color: "white"
                font.family: "Helvetica"
                font.bold: true
                font.pointSize: 40
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }


    }
}

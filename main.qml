import QtQuick 2.15
import QtQuick.Window 2.15
import QtMultimedia
import QtQuick.Controls



Window {
    width: 640
    height: 480
    visible: true
    color: "white"

    property alias source: mediaPlayer.source


    VideoFile {
        y: 100
        x: 320
        id: menuBar
        mediaPlayer: mediaPlayer
        videoOutput: videoOutput
    }






    Rectangle {
        id: videoRectangle
        property var size: (Screen.width < Screen.height) ? Screen.width - 1 : Screen.height - 1
        width: size
        height: size/1.25
        x: Screen.width / 2 - width / 2
        y: Screen.height / 2 - height / 2
        color: "lightgrey"


        MediaPlayer {
            id: mediaPlayer
            audioOutput: AudioOutput {
                id: audio
                volume: videoControls.volume
            }
            videoOutput: videoOutput
            loops: videoControls.toggle == 1 ? MediaPlayer.Infinite : 1
        }

        VideoOutput {
            id: videoOutput
            anchors.fill: parent

        }

        VideoControls {
            id: videoControls

            anchors.top: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right

            mediaPlayer: mediaPlayer
        }


    }







    Component.onCompleted: mediaPlayer.play()
}



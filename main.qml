import QtQuick 2.15
import QtQuick.Window 2.15
import QtMultimedia



Window {
    width: Screen.width
    height: Screen.height
    visible: true
    color: "white"

    property alias source: mediaPlayer.source


    VideoFile {
        y: (videoRectangle.y)/2 - (Screen.height/31.4)
        x: Screen.width/2 - (Screen.height/10)
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
    }
    Rectangle {
        id: controlRectangle
        anchors.top: videoRectangle.bottom
        width: Screen.width - 1
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



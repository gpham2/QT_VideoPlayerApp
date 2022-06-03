import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia
import QtQuick.Window 2.15

Item {
    id: root

    required property MediaPlayer mediaPlayer
    property int mediaProgress: mediaPlayer.playbackState
    property int toggle: loopToggle.position
    property alias volume: videoAudio.volume


        ColumnLayout {
            id: playbackControlPanel
            Layout.preferredWidth: Screen.width
            VideoSlider {
                Layout.leftMargin: 15
                Layout.rightMargin: 15
                Layout.preferredWidth: Screen.width - 30
                mediaPlayer: root.mediaPlayer
            }

            Item {
                height: 20
                width: parent.width
            }


            RowLayout {

                id: controlButtons
                Layout.alignment: Qt.AlignCenter
                Layout.rightMargin: loopToggle.width
                Layout.leftMargin: VideoAudio.width
                spacing: (Screen.width - 393) <= 0 ? 0: (Screen.width - 393)/16.9

                VideoAudio {
                    id: videoAudio
                    Layout.leftMargin: 10;
                    Layout.minimumWidth: 100
                    Layout.maximumWidth: 150
                    Layout.fillWidth: true
                    mediaPlayer: root.mediaPlayer

                }

//                RoundButton {
//                    id: pauseButton
//                    radius: 300.0

//                    Text {
//                        text: "\u23F8";
//                        font.pointSize: Screen.height/40
//                        anchors.verticalCenter: parent.verticalCenter
//                        anchors.horizontalCenter: parent.horizontalCenter
//                    }
//                    onClicked: mediaPlayer.pause()

//                    Layout.preferredWidth: Screen.height/13
//                    Layout.preferredHeight: Screen.height/13

//                }

                ButtonComp {
                    id: pauseButton
                    displayText: "\u23F8"
                    onClicked: mediaPlayer.pause()
                    Layout.preferredWidth: Screen.height/13.5
                    Layout.preferredHeight: Screen.height/13.5
                }

                ButtonComp {
                    id: playButton
                    displayText: "\u25B6"
                    onClicked: mediaPlayer.play()
                    Layout.preferredWidth: Screen.height/13.5
                    Layout.preferredHeight: Screen.height/13.5
                }

                ButtonComp {
                    id: stopButton
                    displayText: "\u23F9"
                    onClicked: mediaPlayer.stop()
                    Layout.preferredWidth: Screen.height/13.5
                    Layout.preferredHeight: Screen.height/13.5
                }

                Switch {
                    id: loopToggle
                    Material.accent: Material.DeepOrange
                    text: "loop"
                }
        }
    }
}

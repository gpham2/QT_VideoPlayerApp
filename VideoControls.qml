import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia

Item {
    id: root

    required property MediaPlayer mediaPlayer
    property int mediaProgress: mediaPlayer.playbackState
    property int toggle: loopToggle.position
    property alias volume: videoAudio.volume

    height: frame.height
    width: frame.width

    Frame {
        id: frame
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        background: Rectangle {
            color: "white"
        }

        ColumnLayout {
            id: playbackControlPanel
            anchors.fill: parent
            anchors.leftMargin: 10
            anchors.rightMargin: 10

            VideoSlider {
                Layout.fillWidth: true
                mediaPlayer: root.mediaPlayer
            }

            Item {
                height: 20
                width: parent.width
            }




            RowLayout {

                id: controlButtons


                VideoAudio {
                    id: videoAudio
                    Layout.minimumWidth: 100
                    Layout.maximumWidth: 150
                    Layout.fillWidth: true
                    mediaPlayer: root.mediaPlayer

                }

                Layout.alignment: Qt.AlignCenter
                Layout.rightMargin: loopToggle.width
                Layout.leftMargin: VideoSlider.width
                spacing: 30



                RoundButton {
                    id: pauseButton
                    radius: 300.0

                    Text {
                        text: "\u23F8";
                        font.pointSize: 35
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    onClicked: mediaPlayer.pause()
                    Layout.preferredWidth: 100
                    Layout.preferredHeight: 100


                }

                RoundButton {
                    id: playButton
                    radius: 300.0
                    Text {
                        text: "\u25B6"
                        font.pointSize: 35
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    onClicked: mediaPlayer.play()
                    Layout.preferredWidth: 100
                    Layout.preferredHeight: 100


                }

                RoundButton {
                    id: stopButton
                    radius: 300.0
                    Text {
                        text: "\u23F9";
                        font.pointSize: 35
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    onClicked: mediaPlayer.stop()
                    Layout.preferredWidth: 100
                    Layout.preferredHeight: 100

                }



                Switch {
                    id: loopToggle
                    Material.accent: Material.DeepOrange
                    text: "loop"
                }



            }




        }
    }
}

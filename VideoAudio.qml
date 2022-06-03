import QtQuick 2.0
import QtQuick.Layouts
import QtMultimedia

Item {
    id: root

    required property MediaPlayer mediaPlayer
    property real volume: volumeSlider.value/1.

    implicitHeight: buttons.height

    RowLayout {
        anchors.fill: parent

        Item {
            id: buttons

            width: soundIcon.implicitWidth
            height: soundIcon.implicitHeight

            Rectangle {
                id: soundIcon
                implicitWidth: Screen.height/20
                implicitHeight: implicitWidth
                radius: implicitWidth/2
                color: "#E9E9E9"
                Text {
                    id: icon
                    text: String.fromCodePoint(0x1F50A)//"\u1F50A"
                    font.pointSize: soundIcon.implicitHeight * .5
                    anchors.verticalCenter: soundIcon.verticalCenter
                    anchors.horizontalCenter: soundIcon.horizontalCenter
                }
            }


        }

//        Slider {
//            id: volumeSlider
//            Layout.fillWidth: true
//            Layout.alignment: Qt.AlignVCenter
//            Material.accent: Material.DeepOrange
//            enabled: true
//            to: 100.0
//            value: 100.0
//        }

        SliderComp {
            id: volumeSlider
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
            isVideo: false
            mediaPlayer: root.mediaPlayer
            mainColor: "#FF5722"
            secondaryColor: "#FFAB91"
            value: 1
        }
    }
}

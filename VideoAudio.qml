import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia

Item {
    id: root

    required property MediaPlayer mediaPlayer
    property real volume: volumeSlider.value/100.

    implicitHeight: buttons.height

    RowLayout {
        anchors.fill: parent

        Item {
            id: buttons

            width: muteButton.implicitWidth
            height: muteButton.implicitHeight

            RoundButton {
                id: muteButton
                radius: 50.0
                text: String.fromCodePoint(0x1F50A)//"\u1F50A"
            }
        }

        Slider {
            id: volumeSlider
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
            Material.accent: Material.DeepOrange
            enabled: true
            to: 100.0
            value: 100.0
        }
    }
}

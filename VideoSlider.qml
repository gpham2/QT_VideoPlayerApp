import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts
import QtMultimedia
import QtQuick.Window 2.15

Item {
    id: root

    required property MediaPlayer mediaPlayer
    height: 20
    RowLayout {


        Material.accent: Material.Orange
        anchors.fill: parent


        Slider {
            id: videoSlider 
            Layout.fillWidth: true
            enabled: mediaPlayer.seekable
            value: mediaPlayer.position / mediaPlayer.duration
            onMoved: mediaPlayer.setPosition(value * mediaPlayer.duration)
            to: 1.0
        }


    }

}

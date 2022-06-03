import QtQuick 2.0
import QtMultimedia

Item {
    id: root

    required property MediaPlayer mediaPlayer
    property bool isVideo: true
    property double value:   isVideo ? mediaPlayer.position / mediaPlayer.duration : 1
    property double maximum:  1.0
    property double minimum:  0.0
    property color mainColor: "orange"
    property color secondaryColor: "peachpuff"



    width: 200
    height: 50

    signal clicked(double value);

    function setLoc(pixels) {
        var value = (maximum - minimum) / (root.width - pill.width) * (pixels - pill.width / 2) + minimum // value from pixels
        if (root.isVideo) mediaPlayer.setPosition(value * mediaPlayer.duration)
        else root.value = value
    }

    Rectangle {
            id: pill

            x: (value - minimum) / (maximum - minimum) * (root.width - pill.width)
            width: parent.height/3
            height: width
            y: parent.height/3
            radius: 0.5 * width
            color: root.mainColor
    }

    Repeater {
            model: 1

            delegate: Rectangle {
                x: 0
                width: pill.x
                height: 0.1 * root.height
                radius: 0.5 * height
                color: root.mainColor
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    Repeater {
            model: 1

            delegate: Rectangle {
                x:     pill.x + pill.width - radius + 1
                width: root.width - x
                height: 0.1 * root.height
                radius: 0.5 * height
                color: root.secondaryColor
                anchors.verticalCenter: parent.verticalCenter
            }
        }

    MouseArea {
            id: mouseArea

            anchors.fill: parent

            drag {
                target:   pill
                axis:     Drag.XAxis
                maximumX: root.width - pill.width
                minimumX: 0
            }
            onClicked:                          setLoc(mouseX)
            onPositionChanged:  if(drag.active) setLoc(pill.x + 0.5 * pill.width)

        }




}

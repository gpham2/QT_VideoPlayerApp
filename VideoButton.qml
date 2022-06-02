import QtQuick 2.0
import QtQuick.Window 2.15
Item {
    id: root

    // properties of button
    property color baseColor: "blue"
    property color pressedColor: "red"
    property string displayText: ""

    // what button does when pressed
    signal clicked()


       // Looks of the button
       Rectangle {
           id: body
           radius: 200
           color: "red"
           anchors.fill: parent

           MouseArea {
               id: area
               anchors.fill:parent
               hoverEnabled: true
               onPressed: {
                   body.color = root.pressedColor
                   root.clicked()

               }

               onReleased: {
                   body.color = root.baseColor
               }
           }

           Text {
               text: root.displayText
               font.pointSize: Screen.height/40
               anchors.verticalCenter: parent.verticalCenter
               anchors.horizontalCenter: parent.horizontalCenter
           }


       }
}

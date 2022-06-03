import QtQuick 2.0
import QtQuick.Window 2.15


Item {
    id: root

    // properties of button
    property color baseColor: "#E9E9E9"
    property color pressedColor: "gainsboro"
    property color borderColor: "white"
    property color textColor: "white"
    property double textSize: Screen.height/40
    property string fontFamily: "Helvetica"
    property string displayText: ""
    property bool changeColor: true


    width: 30
    height: 30
    // what button does when pressed
    signal clicked()


       // Looks of the button
       Rectangle {
           id: body
           radius: width
           color: root.baseColor
           anchors.fill: parent
           border.color: root.borderColor
           border.width: 4

           MouseArea {
               id: area
               anchors.fill:parent
               hoverEnabled: true
               onPressed: {
                   root.clicked()
                   if (changeColor == true) {
                   body.color = root.pressedColor
                   }

               }

               onReleased: {
                   body.color = root.baseColor
               }
           }

           Text {
               text: root.displayText
               color: root.textColor
               font.pointSize: root.textSize
               anchors.verticalCenter: parent.verticalCenter
               anchors.horizontalCenter: parent.horizontalCenter
           }


       }
}

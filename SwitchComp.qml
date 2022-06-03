import QtQuick 2.0


Rectangle {
    id: root

    property bool checked: false
    property color mainColor: "#FF5722"
    property color secondaryColor: "#FFAB91"


    signal clicked(bool checked)

// private

    height: 50
    width: 100;
    radius:       0.5  * root.height
    color:        checked? secondaryColor : "darkgray"


    Rectangle {
        id: pill
        x: 0
        width: root.height;
        height: width
        color: root.checked? mainColor : "white"
        radius: parent.radius
        border.width: 1
        border.color: root.checked? mainColor: "#E9E9E9"

    }



    MouseArea {
        id: mouseArea

        anchors.fill: parent

        onPressed: {
            if (root.checked == false) {
                root.checked = true;
                pillMoveRight.start()

            }
            else
            {
                root.checked = false;
                pillMoveLeft.start()
            }
        }


        NumberAnimation {
              id: pillMoveRight
              target: pill
              properties: "x"
              from: 0
              to: root.width - pill.width
              duration: 200
         }

        NumberAnimation {
              id: pillMoveLeft
              target: pill
              properties: "x"
              from: root.width - pill.width
              to: 0
              duration: 200
         }
    }

}

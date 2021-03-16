import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Item {

    property alias value: inputField.text

    width: 50
    height: 30
    onFocusChanged: {
        if(activeFocus) {
            inputField.forceActiveFocus()
        }
    }
    property int fontSize : 12
    Frame {
        anchors.fill: parent
        padding: 0
        TextInput {
            id: inputField
            readOnly: true
            anchors.fill: parent
            inputMask: "000"
            text: "   "
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            font.pointSize: fontSize
            font.underline: activeFocus
            font.family: "Courier"
            Keys.onPressed: {
                if(parseInt(inputField.displayText) === 255) {
                    inputField.text = "   "
                }

                if(event.key >= Qt.Key_0 && event.key <= Qt.Key_9) {
                    if(inputField.selectedText === inputField.displayText) {
                        inputField.text = "  " + event.text
                    }
                    else {
                        inputField.text = inputField.displayText.substring(1,3) + event.text
                    }
                }
                else if(event.key === Qt.Key_Backspace || event.key === Qt.Key_Delete) {
                    inputField.text = " " + inputField.displayText.substring(0,2)
                }
                if(inputField.displayText > 255) {
                    inputField.text = 255
                }
            }
        }
    }




}



/*##^##
Designer {
    D{i:0;formeditorZoom:4}
}
##^##*/

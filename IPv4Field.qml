import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Item {

    width: blocks.width
    height: blocks.height

    function setAddress(str) {
        var blocks = String(str).split(".")
        ipA.value = blocks[0]
        ipB.value = blocks[1]
        ipC.value = blocks[2]
        ipD.value = blocks[3]
    }

    property var address: ""


    function updateAddress() {
        address = ipA.value + "." + ipB.value + "." +  ipC.value + "." +  ipD.value
    }
    Keys.onPressed:  {
        updateAddress()
    }



    FocusScope {
        anchors.fill: parent
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                pasteZone.text = ""
                pasteZone.paste()
                console.log("value : " + pasteZone.text)
                //Check if IPv6
                //https://stackoverflow.com/questions/53497/regular-expression-that-matches-valid-ipv6-addresses
                pasteZone.text.replace(/ /g, "")
                if(pasteZone.text.match(/\b((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\.|$)){4}\b/)) {
                    console.log("Detected IPv4 Address")
                    var blocks = pasteZone.text.split(".")
                    console.log(blocks)
                    //TODO : put  blocks into corresponding elements
                }
            }
            TextInput {
                id: pasteZone
                visible: false
            }
            RowLayout {
                id: blocks
                IPV4Element {
                    id: ipA
                    Layout.alignment: Qt.AlignHCenter
                    Keys.onPressed: {
                        if(event.key === Qt.Key_Period) {
                            ipB.forceActiveFocus()
                        }
                    }
                    Keys.onTabPressed: {
                        ipB.forceActiveFocus()
                    }
                }
                Text {
                    text: "."
                    Layout.alignment: Qt.AlignHCenter
                }
                IPV4Element {
                    id: ipB
                    Layout.alignment: Qt.AlignHCenter
                    Keys.onPressed: {
                        if(event.key === Qt.Key_Period) {
                            ipC.forceActiveFocus()
                        }
                    }
                    Keys.onTabPressed: {
                        ipC.forceActiveFocus()
                    }
                    Keys.onBacktabPressed: {
                        ipA.forceActiveFocus()
                    }
                }
                Text {
                    text: "."
                    Layout.alignment: Qt.AlignHCenter
                }
                IPV4Element {
                    id: ipC
                    Layout.alignment: Qt.AlignHCenter
                    Keys.onPressed: {
                        if(event.key === Qt.Key_Period) {
                            ipD.forceActiveFocus()
                        }
                    }
                    Keys.onTabPressed: {
                        ipD.forceActiveFocus()
                    }
                    Keys.onBacktabPressed: {
                        ipB.forceActiveFocus()
                    }
                }
                Text {
                    text: "."
                    Layout.alignment: Qt.AlignHCenter
                }
                IPV4Element {
                    id: ipD
                    Layout.alignment: Qt.AlignHCenter
                    Keys.onBacktabPressed: {
                        ipC.forceActiveFocus()
                    }
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.33}
}
##^##*/

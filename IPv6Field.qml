import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Item {
    width: blocks.width
    height: blocks.height
    property var address: ""

    function setAddress(str) {
        data = str.replace("::", ":0:") //
        var blocks = data.split(":")
        if(blocks.length < 8 && data.includes(":0:")) {
            while(blocks.length < 8) {
                newData = data.replace(":0:", ":0:0:") //Add one 0
                blocks = data.splot(":")
            }
        }
        console.log(blocks)
        ipA.value = blocks[0]
        ipB.value = blocks[1]
        ipC.value = blocks[2]
        ipD.value = blocks[3]
        ipE.value = blocks[4]
        ipF.value = blocks[5]
        ipG.value = blocks[6]
        ipH.value = blocks[7]
    }

    function updateAddress() {
        address = ipA.value + ":" + ipB.value + ":" +  ipC.value + ":" +  ipD.value + ":" +  ipE.value + ":" +  ipF.value + ":" +  ipG.value + ":" +  ipH.value
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
                if(pasteZone.text.match(/([a-f0-9:]+:+)+[a-f0-9]+/)) {
                    console.log("Detected IPv6 Address")
                    //TODO : parse IPv6 and put in blocks
                }
            }
            TextInput {
                id: pasteZone
                visible: false
            }
            RowLayout {
                id: blocks
                IPv6Element {
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
                    text: ":"
                    Layout.alignment: Qt.AlignHCenter
                }
                IPv6Element {
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
                    text: ":"
                    Layout.alignment: Qt.AlignHCenter
                }
                IPv6Element {
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
                    text: ":"
                    Layout.alignment: Qt.AlignHCenter
                }
                IPv6Element {
                    id: ipD
                    Layout.alignment: Qt.AlignHCenter
                    Keys.onTabPressed: {
                        ipE.forceActiveFocus()
                    }
                    Keys.onBacktabPressed: {
                        ipC.forceActiveFocus()
                    }
                }
                Text {
                    text: ":"
                    Layout.alignment: Qt.AlignHCenter
                }
                IPv6Element {
                    id: ipE
                    Layout.alignment: Qt.AlignHCenter
                    Keys.onTabPressed: {
                        ipF.forceActiveFocus()
                    }
                    Keys.onBacktabPressed: {
                        ipD.forceActiveFocus()
                    }
                }
                Text {
                    text: ":"
                    Layout.alignment: Qt.AlignHCenter
                }
                IPv6Element {
                    id: ipF
                    Layout.alignment: Qt.AlignHCenter
                    Keys.onTabPressed: {
                        ipG.forceActiveFocus()
                    }
                    Keys.onBacktabPressed: {
                        ipE.forceActiveFocus()
                    }
                }
                Text {
                    text: ":"
                    Layout.alignment: Qt.AlignHCenter
                }
                IPv6Element {
                    id: ipG
                    Layout.alignment: Qt.AlignHCenter
                    Keys.onTabPressed: {
                        ipH.forceActiveFocus()
                    }
                    Keys.onBacktabPressed: {
                        ipF.forceActiveFocus()
                    }
                }
                Text {
                    text: ":"
                    Layout.alignment: Qt.AlignHCenter
                }
                IPv6Element {
                    id: ipH
                    Layout.alignment: Qt.AlignHCenter
                    Keys.onBacktabPressed: {
                        ipG.forceActiveFocus()
                    }
                }
            }
        }

    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/

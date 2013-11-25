import QtQuick 1.1
import SessionType 0.1
import SystemType 0.1
import "common" as Common
import "./bars" as Bars
import "./info" as Info

Rectangle {
    id: window
    width: parent.width; height: 475
    //背景
    Image {
        source: "../img/skin/bg-bottom-tab.png"
        anchors.fill: parent
    }

    function addList() {
        listModel.clear();//清空
        listModel.append({"name": qsTr("Computer"), "flag": "computer"});
        listModel.append({"name": qsTr("CPU"), "flag": "cpu"});
        listModel.append({"name": qsTr("Board and BIOS"), "flag": "bios"});
        listModel.append({"name": qsTr("Memory"), "flag": "memory"});
        listModel.append({"name": qsTr("Monitor"), "flag": "monitor"});
        systemdispatcher.get_detail_system_message_qt();//获取详细信息
    }

    ListModel {
        id: listModel
        Component.onCompleted: {
            window.addList();
        }
    }
    Row {
        anchors {
            left: parent.left
            leftMargin: 2
        }
        //左边标题栏
        Rectangle {
            width: 150; height: window.height
            color: "white" //"#efefef"
            ListView {
                focus: true
                id: categories
                anchors.fill: parent
                model: listModel
                footer: returnDelegate
                delegate: DetailDelegate {
                    onSendFlag: {
                        if(flag == "computer") {
                            window.state = "ComputerPage";
                        }
                        else if(flag == "cpu") {
                            window.state = "CPUPage";
                        }
                        else if(flag == "bios") {
                            window.state = "BiosPage";
                        }
                        else if(flag == "memory") {
                            window.state = "MemoryPage";
                        }
                        else if(flag == "monitor") {
                            window.state = "MonitorPage";
                        }
                    }
                }
                highlight: Rectangle { width: ListView.view.width - 2; color: "steelblue" }//选中后的深色块
            }
            Bars.ScrollBar {
                scrollArea: categories; height: categories.height; width: 8
                anchors.right: categories.right
            }
        }

        //右边内容栏
        Item {
            width: window.width - 150 - 4; height: window.height
            Info.ComputerInfo {
                id: computerLayer
                width: parent.width
                height: parent.height
                visible: true
            }
            Info.CpuInfo {
                id: cpuLayer
                width: parent.width
                height: parent.height
//                x: (parent.width * 1.5)
                visible: false
            }
            Info.BiosInfo {
                id: biosLayer
                width: parent.width
                height: parent.height
//                x: (parent.width * 1.5)
                visible: false
            }
            Info.MemoryInfo {
                id: memoryLayer
                width: parent.width
                height: parent.height
//                x: (parent.width * 1.5)
                visible: false
            }
            Info.MonitorInfo {
                id: monitorLayer
                width: parent.width
                height: parent.height
//                x: (parent.width * 1.5)
                visible: false
            }

//            Rectangle {
//                id: computerLayer
//                width: parent.width
//                height: parent.height
////                x: (parent.width * 1.5);
//                //背景
//                Image {
//                    source: "../img/skin/bg-middle.png"
//                    anchors.fill: parent
//                }
//                Text {
//                    text: qsTr("11111111111")//软件操作进度
//                    color: "#318d11"
//                    wrapMode: Text.WordWrap
//                    font.pixelSize: 12
//                    anchors.horizontalCenter: parent.horizontalCenter
//                }

//            }

//            Rectangle {
//                id: cpuLayer
//                width: parent.width
//                height: parent.height
//                x: (parent.width * 1.5);
//                //背景
//                Image {
//                    source: "../img/skin/bg-middle.png"
//                    anchors.fill: parent
//                }
//                Text {
//                    text: qsTr("22222222222")//软件操作进度
//                    color: "#318d11"
//                    wrapMode: Text.WordWrap
//                    font.pixelSize: 12
//                    anchors.horizontalCenter: parent.horizontalCenter
//                }
//            }

//            Rectangle {
//                id: biosLayer
//                width: parent.width
//                height: parent.height
//                x: (parent.width * 1.5);
//                //背景
//                Image {
//                    source: "../img/skin/bg-middle.png"
//                    anchors.fill: parent
//                }
//                Text {
//                    text: qsTr("3333333333")//软件操作进度
//                    color: "#318d11"
//                    wrapMode: Text.WordWrap
//                    font.pixelSize: 12
//                    anchors.horizontalCenter: parent.horizontalCenter
//                }
//            }
//            Rectangle {
//                id: memoryLayer
//                width: parent.width
//                height: parent.height
//                x: (parent.width * 1.5);
//                //背景
//                Image {
//                    source: "../img/skin/bg-middle.png"
//                    anchors.fill: parent
//                }
//                Text {
//                    text: qsTr("444444444")//软件操作进度
//                    color: "#318d11"
//                    wrapMode: Text.WordWrap
//                    font.pixelSize: 12
//                    anchors.horizontalCenter: parent.horizontalCenter
//                }
//            }
//            Rectangle {
//                id: monitorLayer
//                width: parent.width
//                height: parent.height
//                x: (parent.width * 1.5);
//                //背景
//                Image {
//                    source: "../img/skin/bg-middle.png"
//                    anchors.fill: parent
//                }
//                Text {
//                    text: qsTr("55555555555555")//软件操作进度
//                    color: "#318d11"
//                    wrapMode: Text.WordWrap
//                    font.pixelSize: 12
//                    anchors.horizontalCenter: parent.horizontalCenter
//                }
//            }
        }
    }
    Component {
        id: returnDelegate
        Item {
            width: categories.width; height: 60
            Text {
                text: qsTr("Back")
                font { family: "Helvetica"; pixelSize: 16; bold: true }
                anchors {
                    left: parent.left; leftMargin: 15
                    verticalCenter: parent.verticalCenter
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: pageStack.push(systemmessage);
            }
        }
    }
    Rectangle { x: 150; height: window.height; width: 1; color: "#cccccc" }

    states: [
        State {
            name: "ComputerPage"
            PropertyChanges { target: computerLayer; visible: true }
            PropertyChanges { target: cpuLayer;  visible: false }
            PropertyChanges { target: biosLayer; visible: false }
            PropertyChanges { target: memoryLayer; visible: false }
            PropertyChanges { target: monitorLayer; visible: false }
        },
        State {
            name: "CPUPage"
            PropertyChanges { target: computerLayer; visible: false }
            PropertyChanges { target: cpuLayer;  visible: true }
            PropertyChanges { target: biosLayer; visible: false }
            PropertyChanges { target: memoryLayer; visible: false }
            PropertyChanges { target: monitorLayer; visible: false }
        },
        State {
            name: "BiosPage"
            PropertyChanges { target: computerLayer; visible: false }
            PropertyChanges { target: cpuLayer;  visible: false }
            PropertyChanges { target: biosLayer; visible: true }
            PropertyChanges { target: memoryLayer; visible: false }
            PropertyChanges { target: monitorLayer; visible: false }
        },
        State {
            name: "MemoryPage"
            PropertyChanges { target: computerLayer; visible: false }
            PropertyChanges { target: cpuLayer;  visible: false }
            PropertyChanges { target: biosLayer; visible: false }
            PropertyChanges { target: memoryLayer; visible: true }
            PropertyChanges { target: monitorLayer; visible: false }
        },
        State {
            name: "MonitorPage"
            PropertyChanges { target: computerLayer; visible: false }
            PropertyChanges { target: cpuLayer;  visible: false }
            PropertyChanges { target: biosLayer; visible: false }
            PropertyChanges { target: memoryLayer; visible: false }
            PropertyChanges { target: monitorLayer; visible: true }
        }
    ]
//    states: [
//        State {
//            name: "ComputerPage"
//            PropertyChanges { target: computerLayer; x: 0 }
//            PropertyChanges { target: cpuLayer; x: (parent.width * 1.5) }
//            PropertyChanges { target: biosLayer; x: (parent.width * 1.5) }
//            PropertyChanges { target: memoryLayer; x: (parent.width * 1.5) }
//            PropertyChanges { target: monitorLayer; x: (parent.width * 1.5) }
//        },
//        State {
//            name: "CPUPage"
//            PropertyChanges { target: computerLayer; x: (parent.width * 1.5) }
//            PropertyChanges { target: cpuLayer; x: 0 }
//            PropertyChanges { target: biosLayer; x: (parent.width * 1.5) }
//            PropertyChanges { target: memoryLayer; x: (parent.width * 1.5) }
//            PropertyChanges { target: monitorLayer; x: (parent.width * 1.5) }
//        },
//        State {
//            name: "BiosPage"
//            PropertyChanges { target: computerLayer; x: (parent.width * 1.5) }
//            PropertyChanges { target: cpuLayer; x: (parent.width * 1.5) }
//            PropertyChanges { target: biosLayer; x: 0 }
//            PropertyChanges { target: memoryLayer; x: (parent.width * 1.5) }
//            PropertyChanges { target: monitorLayer; x: (parent.width * 1.5) }
//        },
//        State {
//            name: "MemoryPage"
//            PropertyChanges { target: computerLayer; x: (parent.width * 1.5) }
//            PropertyChanges { target: cpuLayer; x: (parent.width * 1.5) }
//            PropertyChanges { target: biosLayer; x: (parent.width * 1.5) }
//            PropertyChanges { target: memoryLayer; x: 0 }
//            PropertyChanges { target: monitorLayer; x: (parent.width * 1.5) }
//        },
//        State {
//            name: "MonitorPage"
//            PropertyChanges { target: computerLayer; x: (parent.width * 1.5) }
//            PropertyChanges { target: cpuLayer; x: (parent.width * 1.5) }
//            PropertyChanges { target: biosLayer; x: (parent.width * 1.5) }
//            PropertyChanges { target: memoryLayer; x: (parent.width * 1.5) }
//            PropertyChanges { target: monitorLayer; x: 0 }
//        }
//    ]
}




//Rectangle {
//    id:root
//    width: parent.width
//    height: 435

//    ListModel {
//        id: infoModel
//        ListElement {
//            name: "Info1"; icon: "../img/icons/checkscreen.png"; flag: "info1"
//        }
//        ListElement {
//            name: "Info2"; icon: "../img/icons/cookie.png"; flag: "info2"
//        }
//        ListElement {
//            name: "Info3"; icon: "../img/icons/deb.png"; flag: "info3"
//        }
//        ListElement {
//            name: "Info4"; icon: "../img/icons/deepclear.png"; flag: "info4"
//        }
//        ListElement {
//            name: "Info5"; icon: "../img/icons/fcitx.png"; flag: "info5"
//        }
//        ListElement {
//            name: "Info6"; icon: "../img/icons/font.png"; flag: "info6"
//        }
//        ListElement {
//            name: "Info7"; icon: "../img/icons/iconbeauty.png"; flag: "info7"
//        }
//    }

//    Component {
//        id: infoDelegate
//        Item {
//            width: 100
//            height: 100
//            scale: PathView.iconScale
//            Image {
//                id: infoIcon
//                y:20
//                anchors.horizontalCenter: parent.horizontalCenter
//                source: icon
//                smooth: true
//            }
//            Text {
//                anchors {
//                    top: infoIcon.bottom
//                    horizontalCenter: parent.horizontalCenter
//                }
//                text: name
//                smooth: true
//            }
//            MouseArea {
//                anchors.fill: parent
//                onClicked: {
//                    view.currentIndex = index;
//                    console.log(flag)
//                }
//            }
//        }
//    }

//    Component {
//        id: infoHighlight
//        Rectangle {
//            width: 80
//            height: 80
//            color: "lightsteelblue"
//        }
//    }

//    PathView {
//        id: view
//        anchors.fill: parent
//        highlight: infoHighlight
//        preferredHighlightBegin: 0.5
//        preferredHighlightEnd: 0.5
//        focus: true
//        model: infoModel
//        delegate: infoDelegate
//        path: Path {
//            startX: 10
//            startY: 50
//            PathAttribute {
//                name: "iconScale"
//                value: 0.5
//            }
//            PathQuad {
//                x: 200; y: 150; controlX: 50; controlY: 200
//            }
//            PathAttribute {
//                name: "iconScale"
//                value: 1.0
//            }
//            PathQuad {
//                x: 390; y: 50; controlX: 350; controlY: 200
//            }
//            PathAttribute {
//                name: "iconScale"
//                value: 0.5
//            }
//        }
//    }
//}
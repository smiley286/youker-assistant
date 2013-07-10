/*
 * Copyright (C) 2013 National University of Defense Technology(NUDT) & Kylin Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
import QtQuick 1.1
import QtDesktop 0.1
//import RegisterMyType 0.1
import SessionType 0.1
//import SystemType 0.1
import "common" as Common

Rectangle {
    id:root
//    property Dispatcher dis: mydispather
    property SessionDispatcher dis: sessiondispatcher
    width: parent.width
    height: 420//340
//    color:"#c3c3c3"
    //垃圾清理自定义标题栏

    Component.onCompleted: {
    }


    Common.MyTitleBar {
        id: titleBar; width: parent.width; height: 45; opacity: 0.9
        btn_text: "开始扫描"
        title: "清理浏览器历史记录"
        description:  "清理浏览器历史记录可以保障系统安全"
        btn_flag: "history_scan"
    }

    ScrollArea {
        frame:false
        anchors.fill: parent
        anchors.top: titleBar.bottom
        anchors.topMargin: 50
        Item {
            width:parent.width
            height:450//content.height + 50//1000//this height must be higher than root.height, then the slidebar can display
//            Component {
//                id: statusDelegate
//                RubbishStatus {
//                    id: content
//                }
//            }
            ListModel {
                id: streamModel
                ListElement {
                    title: "清理浏览器历史记录"
                    picture: "../img/icons/user.png"
                    detailstr: "清理浏览器历史记录，让系统更安全"
                    flags: "clear_history"
                }
            }

            //垃圾清理显示内容
            ListView {
                id: listView
                height: parent.height - titleBar.height
                width: parent.width
                model: streamModel
                delegate: RubbishDelegate {}


//                model: myModel
//                 delegate: Rectangle {
//                     height: 25
//                     width: 100
//                     Text { text: modelData }
//                 }


                cacheBuffer: 1000


                opacity: 1
                spacing: 10
                snapMode: ListView.NoSnap
//                cacheBuffer: parent.height
                boundsBehavior: Flickable.DragOverBounds
                currentIndex: 0
                preferredHighlightBegin: 0
                preferredHighlightEnd: preferredHighlightBegin
                highlightRangeMode: ListView.StrictlyEnforceRange
            }
        }//Item
    }//ScrollArea
}


//Item {
//    id: screen; width: parent.width; height: 420
////    property SystemDispatcher dis: systemdispatcher
//    property bool inListView : false

//    anchors.fill: parent

//    Rectangle {
//        id: background
//        anchors.fill: parent
////        color: "white"

//        //垃圾清理自定义标题栏
//        Common.MyTitleBar {
//            id: titleBar; width: parent.width; height: 45; opacity: 0.9
//            btn_text: "开始扫描"
//            title: "清理浏览器历史记录"
//            description:  "清理浏览器历史记录可以保障系统安全"
//            btn_flag: "history_scan"
//        }

//        Item {
//            id: views
//            width: parent.width
//            height: screen.height// - titlebar.height
//            ScrollArea {
//                frame:false
////                anchors.fill: parent
////                anchors.top: titleBar.bottom
////                anchors.topMargin: 50
//                anchors {
//                    fill: parent
//                    top: titleBar.bottom
//                    topMargin: 50
//                }

//                Item {
//                    width:parent.width
//                    height:content.height + 50//1000//this height must be higher than root.height, then the slidebar can display
//        //            Component {
//        //                id: statusDelegate
//        //                RubbishStatus {
//        //                    id: content
//        //                }
//        //            }
//                    ListModel {
//                        id: streamModel
//                        ListElement {
//                            title: "清理浏览器历史记录"
//                            picture: "../img/icons/user.png"
//                            detailstr: "清理浏览器历史记录，让系统更安全"
//                            flags: "clear_history"
//                        }
//                    }

//                    //垃圾清理显示内容
//                    ListView {
//                        id: listView
//                        height: parent.height - titlebar.height
//                        width: parent.width
//                        model: streamModel
//                        delegate: RubbishDelegate {}
//                        cacheBuffer: 1000


//                        opacity: 1
//                        spacing: 10
//                        snapMode: ListView.NoSnap
//        //                cacheBuffer: parent.height
//                        boundsBehavior: Flickable.DragOverBounds
//                        currentIndex: 0
//                        preferredHighlightBegin: 0
//                        preferredHighlightEnd: preferredHighlightBegin
//                        highlightRangeMode: ListView.StrictlyEnforceRange
//                    }
//                }//Item
//            }//ScrollArea
//        }
//    }
//}





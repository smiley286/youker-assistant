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
import SystemType 0.1
//Item {
//    id: btn
//    signal clicked
////    property string text
//    property string text : ""
//    property string hoverimage: "list_item_active.png"
//    BorderImage {
//        id: buttonImage
//        source: "../../img/icons/" + btn.hoverimage
//        width: btn.width; height: btn.height
//    }
//    BorderImage {
//        id: pressed
//        opacity: 0
//        source: "../../img/icons/unselect.png"
//        width: btn.width; height: btn.height
//    }
//    Image {
//        id: btnImg
//        anchors.fill: parent
//        source: ""
//    }
//    MouseArea {
//        id: mouseRegion
//        anchors.fill: buttonImage
//        hoverEnabled: true
////        id: signaltest
////        anchors.fill: parent

////        onEntered: btnImg.source = "../../img/toolWidget/menu_hover.png"
////        onPressed: btnImg.source = "../../img/toolWidget/menu_press.png"
////        //要判断松开是鼠标位置
////        onReleased: btnImg.source = "../../img/toolWidget/menu_hover.png"
////        onExited: btnImg.source = ""

//        onEntered: {
//            btnImg.source = "../../img/toolWidget/menu_hover.png"
////            if (hoverimage == "return.png")
////                btnImg.source = "../../img/icons/return-hover.png"
////            else if (hoverimage == "sort.png")
////                btnImg.source = "../../img/icons/sort-hover.png"
////            else if (hoverimage == "selectpic.png")
////                btnImg.source = "../../img/icons/selectpic-hover.png"
////            else if (hoverimage == "use.png")
////                btnImg.source = "../../img/icons/use-hover.png"
////            else
////                btnImg.source = "../../img/toolWidget/menu_hover.png"
//        }
//        onPressed: {
//            btnImg.source = "../../img/toolWidget/menu_press.png"
////            if (hoverimage == "return.png")
////                btnImg.source = "../../img/icons/return-hover.png"
////            else if (hoverimage == "sort.png")
////                btnImg.source = "../../img/icons/sort-hover.png"
////            else if (hoverimage == "selectpic.png")
////                btnImg.source = "../../img/icons/selectpic-hover.png"
////            else if (hoverimage == "use.png")
////                btnImg.source = "../../img/icons/use-hover.png"
////            else
////                btnImg.source = "../../img/toolWidget/menu_press.png"

//        }
//        //要判断松开是鼠标位置
//        onReleased: {
//            btnImg.source = "../../img/toolWidget/menu_hover.png"
////            if (hoverimage == "return.png")
////                btnImg.source = "../../img/icons/return.png"
////            else if (hoverimage == "sort.png")
////                btnImg.source = "../../img/icons/sort.png"
////            else if (hoverimage == "selectpic.png")
////                btnImg.source = "../../img/icons/selectpic.png"
////            else if (hoverimage == "use.png")
////                btnImg.source = "../../img/icons/use.png"
////            else
////                btnImg.source = "../../img/toolWidget/menu_hover.png"
//        }

//        onExited: btnImg.source = ""



//        onClicked: { btn.clicked(); }
//    }
//    Text {
//        color: "white"
////        visible: (btn.text == "") ? false : true
//        anchors.centerIn: buttonImage; font.bold: true; font.pixelSize: 15
//        text: btn.text; style: Text.Raised; styleColor: "black"
//    }
//    states: [
//        State {
//            name: "Pressed"
//            when: mouseRegion.pressed == true
//            PropertyChanges { target: pressed; opacity: 1 }
//        }
//    ]
//}






Item {
    id: btn
//    signal clicked
//    property string text
//    property string text : ""
//    property string hoverimage: "scan-start.png"

//  按钮的颜色和字体处理
    property string color1:"#87bc1d"
    property string color2:"#6b9e00"
    property string bordercolor:"#6fa200"
    property string text:""
    property int textsize:10
    property bool bold: false

    SystemPalette { id: myPalette; colorGroup: SystemPalette.Active }
//    color: "transparent"
    property SystemDispatcher dis: systemdispatcher
//    property string iconName: "onekeyBtn.png"
    property string setbtn_flag: ""

    property string get_msg: ""
    property bool check_flag: true

    signal clicked();   //如果没有选中任何清理项，提示警告框！first page

    signal send_dynamic_picture(string str);
    //信号绑定，绑定qt的信号finishCleanWork，该信号emit时触发onFinishCleanWork,按钮恢复使能
    Connections{
         target: systemdispatcher
             onFinishCleanWorkMain: {
                 if(setbtn_flag =="onekey"||setbtn_flag=="smallonekey")
                 {
                    if (msg == "") {
                        btn.enabled=true;
                        if (setbtn_flag == "onekey")
                            btnImg.source = "../img/icons/onekeyBtn.png"
                     }
                    else if (msg == "u") {
                         btn.enabled=true;
                    }
                    else if (msg == "c") {
                         btn.enabled=true;
                    }
                    else if (msg == "h") {
                        btn.enabled=true;
                    }
                    else if (msg == "k") {
                        btn.enabled=true;
                    }
                 }
          }
    }
    Connections
    {
        target: systemdispatcher
        onFinishCleanWorkSecond: {
            if(setbtn_flag =="onekey"||setbtn_flag=="smallonekey")
            {
                if (msg == "") {
                     btn.enabled=true;
                    btnImg.source = "../img/icons/onekey.png"
                 }
                 else if (msg == "u") {
                     btn.enabled=true;
                 }
                 else if (msg == "c") {
                     btn.enabled=true;
                 }
                else if (msg == "h") {
                    btn.enabled=true;
                }
                else if (msg == "k") {
                    btn.enabled=true;
                }
            }
        }
    }

//    BorderImage {
//        id: buttonImage
//        source: "../../img/icons/" + btn.hoverimage
//        width: btn.width; height: btn.height
//    }
//    BorderImage {
//        id: pressed
//        opacity: 0
//        source: "../../img/icons/unselect.png"
//        width: btn.width; height: btn.height
//    }

    Rectangle{
        id:btnrec
        anchors.centerIn: parent
        width:btn.width
        height:btn.height
        border.color: bordercolor
        radius:3
        smooth:true
        gradient: Gradient{
            GradientStop{position: 0.0; color: color1}
            GradientStop{position: 1.0; color: color2}
        }
        Image {
            id: btnImg
            anchors.fill: parent
            source: ""
        }
        MouseArea {
            id: mouseRegion
            anchors.fill: parent
            hoverEnabled: true
            onEntered:{
//                console.log(btn.width)
//                console.log(btnrec.width)
//                console.log(mouseRegion.width)
//                console.log(btnImg.width)
                btnImg.source = "../../img/toolWidget/menu_hover.png"
            }
            onPressed: btnImg.source = "../../img/toolWidget/menu_press.png"
            //要判断松开是鼠标位置
            onReleased:btnImg.source = "../../img/toolWidget/menu_hover.png"
            onExited: btnImg.source = ""
            onClicked: {
                btn.clicked();    //如果没有选中任何清理项，提示警告框,发出信号...
                if(check_flag)
                {
                    if (setbtn_flag == "onekey") {
                        send_dynamic_picture("onekey");
                        systemdispatcher.set_user_homedir_qt();
                        systemdispatcher.clean_by_main_one_key_qt(systemdispatcher.get_onekey_args());
//                        btnImg.source = "../img/icons/onekeyover.png"  //首页点击后更换图片的位置7-30
                        btn.text="清理完毕";
                        btn.enabled=false;
                    }
                    else if (setbtn_flag == "smallonekey") {
                        systemdispatcher.set_user_homedir_qt();
                        systemdispatcher.clean_by_second_one_key_qt(systemdispatcher.get_onekey_args2());
//                        btnImg.source = "../img/icons/clear-over.png"  //首页点击后更换图片的位置7-30
                        btn.text="清理完毕";
                        btn.enabled=false;
                    }
                }
                else
                    sessiondispatcher.send_warningdialog_msg("友情提示：","对不起，您没有选中清理项，请确认！");
            }
        }
    }
    Text {
        anchors.centerIn:parent
        text: btn.text
        font.bold: bold
        font.pointSize: textsize
        color: "white"
    }

//    Text {
//        color: "white"
////        visible: (btn.text == "") ? false : true
//        anchors.centerIn: buttonImage; font.bold: true; font.pixelSize: 15
//        text: btn.text; style: Text.Raised; styleColor: "black"
//    }
//    states: [
//        State {
//            name: "Pressed"
//            when: mouseRegion.pressed == true
//            PropertyChanges { target: pressed; opacity: 1 }
//        }
//    ]
}

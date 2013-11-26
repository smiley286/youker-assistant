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
import "../common" as Common
import "../bars" as Bars

Rectangle {
    id: home; width: parent.width; height: 475
    color: "transparent"
    Component.onCompleted: {
        systemdispatcher.get_detail_system_message_qt();//获取详细信息
        logo.source = "../../img/logo/Manufacturer/" + systemdispatcher.getSingleInfo("ComVendor") + ".jpg";

        comvendorText.text = systemdispatcher.getSingleInfo("ComVendor");
        comproductText.text = systemdispatcher.getSingleInfo("ComProduct");
        comversionText.text = systemdispatcher.getSingleInfo("ComVersion");
        comserialText.text = systemdispatcher.getSingleInfo("ComSerial");
        nodeText.text = systemdispatcher.getSingleInfo("node");
        systemText.text = systemdispatcher.getSingleInfo("system");
        platformText.text = systemdispatcher.getSingleInfo("platform");
        architectureText.text = systemdispatcher.getSingleInfo("architecture");
        releaseText.text = systemdispatcher.getSingleInfo("release");
        machineText.text = systemdispatcher.getSingleInfo("machine");


        var timeValue = systemdispatcher.getSingleInfo("uptime");
        var valueHour = Math.floor(timeValue/60);//返回小于等于timeValue/60的最大整数
//        var aa = valueHour.toFixed(0);
        var valueMinute = timeValue % 60;
        if(valueHour == 0) {
            uptimeText.text = valueMinute + qsTr(" Minutes");//分钟
        }
        else {
            uptimeText.text = valueHour + qsTr(" Hours ") + valueMinute + qsTr(" Minutes");//小时 分钟
        }
    }

    Column {
        anchors {
            top: parent.top
            topMargin: 40
            left: parent.left
            leftMargin: 30
        }
        spacing: 20
        Row {
            Text {
                id: titlebar
                text: qsTr("Basic information")//电脑基本信息
                font.bold: true
                font.pixelSize: 14
                color: "#383838"
            }
            Rectangle {width: home.width - titlebar.width - 30 * 2
                anchors.verticalCenter: parent.verticalCenter
                height: 1; color: "#ccdadd"
            }
        }
        Column {
            anchors.left: parent.left
            anchors.leftMargin: 20
            spacing: 15
            Row {
                spacing: 10
                Text {
                    text: qsTr("Vendor:")//制造商：
                    font.pixelSize: 14
                    color: "#7a7a7a"
                    width: 120
                }
                Text {
                    id: comvendorText
                    text: ""//systemdispatcher.getSingleInfo("ComVendor")
                    font.pixelSize: 14
                    color: "#7a7a7a"
                }
            }
            Row {
                spacing: 10
                Text {
                    text: qsTr("Model:")//电脑型号：
                    font.pixelSize: 14
                    color: "#7a7a7a"
                    width: 120
                }
                Text {
                    id: comproductText
                    text: ""//systemdispatcher.getSingleInfo("ComProduct")
                    font.pixelSize: 14
                    color: "#7a7a7a"
                }
            }
            Row {
                spacing: 10
                Text {
                    text: qsTr("Version:")//电脑版本：
                    font.pixelSize: 14
                    color: "#7a7a7a"
                    width: 120
                }
                Text {
                    id: comversionText
                    text: ""//systemdispatcher.getSingleInfo("ComVersion")
                    font.pixelSize: 14
                    color: "#7a7a7a"
                }
            }
            Row {
                spacing: 10
                Text {
                    text: qsTr("Serial:")//序列号：
                    font.pixelSize: 14
                    color: "#7a7a7a"
                    width: 120
                }
                Text {
                    id: comserialText
                    text: ""//systemdispatcher.getSingleInfo("ComSerial")
                    font.pixelSize: 14
                    color: "#7a7a7a"
                }
            }
            Row {
                spacing: 10
                Text {
                    text: qsTr("Hostname:")//主机名：
                    font.pixelSize: 14
                    color: "#7a7a7a"
                    width: 120
                }
                Text {
                    id: nodeText
                    text: ""//systemdispatcher.getSingleInfo("node")
                    font.pixelSize: 14
                    color: "#7a7a7a"
                }
            }
            Row {
                spacing: 10
                Text {
                    text: qsTr("Running Time:")//持续运行时间：
                    font.pixelSize: 14
                    color: "#7a7a7a"
                    width: 120
                }
                Text {
                    id: uptimeText
                    text: ""//systemdispatcher.getSingleInfo("uptime")
                    font.pixelSize: 14
                    color: "#7a7a7a"
                }
            }
            Row {
                spacing: 10
                Text {
                    text: qsTr("OS Model:")//操作系统类型：
                    font.pixelSize: 14
                    color: "#7a7a7a"
                    width: 120
                }
                Text {
                    id: systemText
                    text: ""//systemdispatcher.getSingleInfo("system")
                    font.pixelSize: 14
                    color: "#7a7a7a"
                }
            }
            Row {
                spacing: 10
                Text {
                    text: qsTr("OS Version:")//操作系统版本：
                    font.pixelSize: 14
                    color: "#7a7a7a"
                    width: 120
                }
                Text {
                    id: platformText
                    text: ""//systemdispatcher.getSingleInfo("platform")
                    font.pixelSize: 14
                    color: "#7a7a7a"
                }
            }
            Row {
                spacing: 10
                Text {
                    text: qsTr("Kernel Bit:")//系统位数：
                    font.pixelSize: 14
                    color: "#7a7a7a"
                    width: 120
                }
                Text {
                    id: architectureText
                    text: ""//systemdispatcher.getSingleInfo("architecture")
                    font.pixelSize: 14
                    color: "#7a7a7a"
                }
            }
            Row {
                spacing: 10
                Text {
                    text: qsTr("Kernel Release:")//内核版本：
                    font.pixelSize: 14
                    color: "#7a7a7a"
                    width: 120
                }
                Text {
                    id: releaseText
                    text: ""//systemdispatcher.getSingleInfo("release")
                    font.pixelSize: 14
                    color: "#7a7a7a"
                }
            }
            Row {
                spacing: 10
                Text {
                    text: qsTr("Kernel Architecture:")//内核架构：
                    font.pixelSize: 14
                    color: "#7a7a7a"
                    width: 120
                }
                Text {
                    id: machineText
                    text: ""//systemdispatcher.getSingleInfo("machine")
                    font.pixelSize: 14
                    color: "#7a7a7a"
                }
            }
        }
    }
    //logo
    Image {
        id: logo
        source: ""
        anchors {
            top: parent.top
            topMargin: 50
            right: parent.right
            rightMargin: 30
        }
    }
}

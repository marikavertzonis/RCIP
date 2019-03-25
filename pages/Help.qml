/* Copyright 2015 Esri
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

import QtQuick 2.3
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

import ArcGIS.AppFramework 1.0

import "../components"
import "../data/help_json.js" as HelpData

ColumnLayout {

    TitleBar {
        title: "About RCIP " + app.info.version
        //Layout.fillWidth: true
        anchors.left: parent.left
        anchors.right: parent.right
    }

    Rectangle {
        Layout.fillHeight: true
//        Layout.fillWidth: true
        anchors.left: parent.left
        anchors.right: parent.right


        ScrollView  {
            anchors.fill: parent
            anchors.margins: 15

            ListView {
                spacing: 15 * scaleFactor
                model: HelpData.variable
                delegate:

                    ColumnLayout {
                    width: parent.width * 0.96
                    spacing: 10 * scaleFactor


                    Text {
                        Layout.fillWidth: true
                        wrapMode: Text.WordWrap
                        text: modelData.helpTitle
                        color: "#04367B"
                        font.pointSize: 20 //* app.scaleFactor
                        font.bold: true
                    }

                    Text {
                        Layout.fillWidth: true
                        wrapMode: Text.WordWrap
                        text: modelData.helpDescription
                        color: "#04367B"
                        font.pointSize: 18 //* app.scaleFactor
                    }
                }
            }
        }
    }
}

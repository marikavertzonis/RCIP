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

import QtQuick 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

import "../components"

ColumnLayout {

    TitleBar {
        title: "Suggestions for you to improve in these areas are:"
        Layout.fillWidth: true
    }

    Rectangle {
        id: coachingHintsList
        Layout.fillHeight: true
        Layout.fillWidth: true

        ScrollView  {
            anchors.fill: parent
            anchors.margins: 10

            ListView {
                spacing: 10 //* scaleFactor
                model: selectedCoachingHints
                delegate:

                    Column {
                    width: parent.width
                    spacing: 2 //* scaleFactor

                    Text {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        horizontalAlignment: Text.AlignLeft
                        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                        text: modelData.hintName
                        color: "#04367B"
                        font.bold: true
                        font.pointSize: 20 //* scaleFactor
                    }

                    Text {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        horizontalAlignment: Text.AlignLeft
                        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                        text: modelData.hintDescription
                        color: "#04367B"
                        font.pointSize: 18 //* scaleFactor
                    }
                }
            }
        }
    }

    Item {
        Layout.fillWidth: true
        Layout.preferredHeight: footerButtons.height

        RowLayout {
            id: footerButtons
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.margins: 5 * scaleFactor


            NavigationButton {
                labelNavText: "Back"
                mouseNavButton.onClicked: stackView.push(competency);
            }

            Item {
                Layout.fillWidth: true
            }

            NavigationButton {
                labelNavText: "Start Over"
                mouseNavButton.onClicked: {
                    selectedRecords = [];
                    stackView.push(chooseElement);

                }
            }
        }
    }
}


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
        title: "From your choices, you may have had a problem with:"
        Layout.fillWidth: true
    }

    Rectangle {
        id: competencyList
        Layout.fillHeight: true
        Layout.fillWidth: true


        ScrollView  {
            anchors.fill: parent
            anchors.margins: 10


            ListView {
                spacing: 15 * scaleFactor
                model: selectedRecordsUnique
                delegate:

                    Rectangle {
                    width: parent.width
                    height: delegateItem.height
//                    border.color: "lightgrey"
//                    border.width: 2 * scaleFactor
//                    radius: 5 * scaleFactor

                    Column {
                        id: delegateItem
                        width: parent.width
                        spacing: 10 * scaleFactor

                        Text {
                            id: competencies
                            horizontalAlignment: Text.AlignLeft
                            width: parent.width
                            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                            text: modelData.competencyDescription
                            color: "#04367B"
                            font.bold: true
                            font.pointSize: 20 //* scaleFactor
                        }


                        NavigationButton {
                            anchors.left: parent.left
                            height: app.height * 0.08 //* scaleFactor
                            width: app.width * 0.8 //* scaleFactor
                            labelNavText: possibleCauses.visible ? "Hide possible causes" : "Review possible causes"
                            mouseNavButton.onClicked: possibleCauses.visible = !possibleCauses.visible
                        }

                        Text {
                            id: possibleCauses
                            visible: false
                            horizontalAlignment: Text.AlignLeft
                            width: parent.width
                            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                            text: modelData.possibleCausesDescription
                            color: "#04367B"
                            font.pointSize: 18 //* scaleFactor
                        }
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
                mouseNavButton.onClicked: {
                    selectedRecords = [];
                    stackView.push(nonCompliancelist);
                }
            }

            Item {
                Layout.fillWidth: true
            }

            NavigationButton {
                labelNavText: "Next"
                mouseNavButton.onClicked: stackView.push(coachingHint);

            }
        }
    }
}

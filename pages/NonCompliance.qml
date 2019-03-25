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
import "../data/coachingHints_json.js" as CoachingHints

ColumnLayout {

    TitleBar {
        title: "Choose which of the following happened in your game:"
        Layout.fillWidth: true
    }

    Rectangle {
        id: nonComplianceList
        Layout.fillHeight: true
        Layout.fillWidth: true

        ScrollView  {
            anchors.fill: parent
            anchors.margins: 10

            ListView {
                spacing: 15
                model: dataSource
                delegate:

                    RowLayout {
                    spacing: 10
                    width: parent.width

                    CheckBoxLarge {
                        id:customBox

                        onCheckedChanged: {

                            if (checked) {
                                selectedRecords.push(index);
                            }
                            else {
                                console.log(selectedRecords.indexOf(index));

                                if (selectedRecords.indexOf(index) > -1 ) {
                                    selectedRecords.splice(selectedRecords.indexOf(index), 1)
                                }
                            }
                            console.log(selectedRecords)

                            var selectedCompetency = selectedRecords.reduce(function(p, c) {
                                p[dataSource[c].competencyDescription] = dataSource[c];
                                return p;
                            }, { });

                            var hintIds = selectedRecords.reduce(function(p,c) {
                                dataSource[c].coachingHintsIds.split(",").reduce(function(p2,c2) {
                                    p[c2] = 8;
                                }, 0);
                                return p;
                            }, {});

                            selectedRecordsUnique = [];
                            for (var j in selectedCompetency) {
                                selectedRecordsUnique.push(selectedCompetency[j])
                            }

                            console.log(JSON.stringify(hintIds));


                            selectedCoachingHints = [];
                            for (var m in hintIds) {
                                selectedCoachingHints.push(CoachingHints.variable[m])
                            }

                        }
                    }

                    Text {
                        id: nonComplianceText
                        Layout.fillWidth: true
                        wrapMode: Text.WordWrap
                        maximumLineCount: 3
                        text: modelData.nonComplianceDescription
                        color: "#04367B"
                        font.pointSize: 18 //* app.scaleFactor

                        MouseArea {
                            anchors.fill: parent
                            onClicked:
                                customBox.checked = !customBox.checked

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
                mouseNavButton.onClicked: stackView.push(chooseElement);
            }

            Item {
                Layout.fillWidth: true
            }

            NavigationButton {
                labelNavText: "Next"
                mouseNavButton.onClicked: {
                    if (selectedRecords.length > 0) {
                        stackView.push(competency);
                    }
                }
            }
        }
    }
}

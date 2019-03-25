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
import QtQuick.Layouts 1.1

import "../components"
import "../data/advantage_json.js" as AdvantageData
import "../data/lineout_json.js" as LineoutData
import "../data/restarts_json.js" as RestartsData
import "../data/ruckmaul_json.js" as RuckMaulData
import "../data/scrum_json.js" as ScrumData
import "../data/tackle_json.js" as TackleData


Item {

    TitleBar {
        id: elementTitle
        title: "Choose a game element to review:"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
    }

    ColumnLayout {
        anchors.top: elementTitle.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        MenuButton {
            labelText: "Tackle"
            mouseButton.onClicked: {
                stackView.push(nonCompliancelist);
                dataSource = TackleData.variable;
            }
        }

        MenuButton {
            labelText: "Ruck or maul"
            mouseButton.onClicked: {
                stackView.push(nonCompliancelist);
                dataSource = RuckMaulData.variable;
            }
        }

        MenuButton {
            labelText: "Scrum"
            mouseButton.onClicked: {
                stackView.push(nonCompliancelist);
                dataSource = ScrumData.variable;
            }
        }

        MenuButton {
            labelText: "Advantage"
            mouseButton.onClicked: {
                stackView.push(nonCompliancelist);
                dataSource = AdvantageData.variable;
            }
        }

        MenuButton {
            labelText: "Restarts, kicks and general play"
            mouseButton.onClicked: {
                stackView.push(nonCompliancelist);
                dataSource = RestartsData.variable;
            }
        }

        MenuButton {
            labelText: "Lineout"
            mouseButton.onClicked: {
                stackView.push(nonCompliancelist);
                dataSource = LineoutData.variable;
            }
        }
    }

}


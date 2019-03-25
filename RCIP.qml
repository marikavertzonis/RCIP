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
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

import ArcGIS.AppFramework 1.0

import "pages"

App {
    id: app
    width: 800
    height: 532

    property int scaleFactor : AppFramework.displayScaleFactor
    property var dataSource
    property var selectedRecords: []
    property var selectedRecordsUnique: []
    property var selectedCoachingHints: []

    
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: chooseElement
    }

    Help {
       id: help
       anchors.fill: parent
       visible: false
    }

    Component {
        id: chooseElement
        ChooseElement {}
    }

    Component {
        id: nonCompliancelist
        NonCompliance {}
    }

    Component {
        id: competency
        Competency {}
    }

    Component {
        id: coachingHint
        CoachingHint {}
    }

}

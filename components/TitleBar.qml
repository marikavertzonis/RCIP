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

import QtQuick 2.0

Rectangle {
    id: rectangleToolbar
    height: 90 * scaleFactor
    color: app.info.propertyValue("toolbarColor")

    property alias title: titleText.text

    Text {
        id: titleText
        anchors.left: parent.left
        anchors.right: helpButton.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.margins: 10 * scaleFactor
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        maximumLineCount: 2
        color: "white"
        font.bold: true
        font.pointSize: 20 //* scaleFactor
    }

    Image {
        id: helpButton
        anchors.right: parent.right
        anchors.margins: 10
        anchors.verticalCenter: parent.verticalCenter
        height: parent.height *0.6
        fillMode: Image.PreserveAspectFit
        source: help.visible ? "../cancel.png" : "../help.png"

        MouseArea {
            anchors.fill: parent
            onPressed: help.visible = !help.visible
        }
    }
}

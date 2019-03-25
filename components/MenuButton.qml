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

Rectangle {
    id: backgroundButton
    Layout.fillWidth: true
    Layout.margins: 10
    height: lblText.paintedHeight + lblText.anchors.margins * 3
    color: app.info.propertyValue("menuButtonColor")
    radius: 5 * scaleFactor

    property alias labelText: lblText.text
    property alias mouseButton: btnMenuMouseArea

    Text {
        id: lblText
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.margins: 10 * scaleFactor
        clip: true
        wrapMode: Text.WordWrap
        color: "white"
        font.pointSize: 18 //* scaleFactor
    }


    MouseArea {
        id: btnMenuMouseArea
        anchors.fill: parent
        onPressed:
            backgroundButton.color = app.info.propertyValue("menuButtonColorPressed");
        onReleased: {
            backgroundButton.color = app.info.propertyValue("menuButtonColor")
        }
    }

}


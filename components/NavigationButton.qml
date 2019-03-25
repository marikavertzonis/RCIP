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
    id: backgroundNavButton
    height: app.height * 0.1 //* scaleFactor
    width: app.width * 0.2 //* scaleFactor
    color: app.info.propertyValue("navigationButtonColor")
    radius: 5 * scaleFactor

    property alias labelNavText: lblNavText.text
    property alias mouseNavButton: btnNavMouseArea

    Text {
        id: lblNavText
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
        id: btnNavMouseArea
        anchors.fill: parent
        onPressed:
            backgroundNavButton.color = app.info.propertyValue("navigationButtonColorPressed");
        onReleased: {
            backgroundNavButton.color = app.info.propertyValue("navigationButtonColor")
        }
    }

}


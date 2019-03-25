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
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.2

CheckBox {

    style: CheckBoxStyle {
        indicator: Rectangle {
            implicitWidth: 34 * scaleFactor
            implicitHeight: 34 * scaleFactor
            radius: 18 * scaleFactor
            border.color: "#04367B"
            border.width: 1 * scaleFactor
            Rectangle {
                anchors.fill: parent
                visible: control.checked
                color: "#F8C72D"
                radius: 18 * scaleFactor
                anchors.margins: 4 * scaleFactor
            }
        }
    }
}

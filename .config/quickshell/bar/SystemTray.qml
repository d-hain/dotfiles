import Quickshell.Services.SystemTray
import Quickshell.Widgets
import QtQuick

BarRectangle {
    id: rect
    property real iconSize: 18

    implicitWidth: SystemTray.items.values.length * this.iconSize + root.margin * 3
    rightBorder: true

    Repeater {
        model: SystemTray.items

        IconImage {
            required property SystemTrayItem modelData
            source: modelData.icon

            implicitSize: rect.iconSize
            anchors.centerIn: parent
        }
    }
}

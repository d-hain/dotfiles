import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

import "."

Scope {
  id: root
  readonly property real barHeight: 42
  readonly property real margin: 5

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }

  Variants {
    model: Quickshell.screens

    PanelWindow { // Background
      // This magically makes it appear on all monitors, no idea how and why
      required property var modelData
      screen: modelData

      implicitHeight: root.barHeight
      anchors {
        top: true
        left: true
        right: true
      }

      RowLayout {
        anchors.right: parent.right
        spacing: 10

        Rectangle { // System Tray
          color: "green"
          Layout.topMargin: root.margin
          Layout.bottomMargin: root.margin
          Layout.preferredWidth: 60
          Layout.preferredHeight: root.barHeight - root.margin * 2
        }
        DateAndTime {
          clock: root.clock
          margin: root.margin
          barHeight: root.barHeight - root.margin * 2
        }
      }
    }
  }
}

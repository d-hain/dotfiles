import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

Scope {
  id: root
  readonly property real barHeight: 42
  readonly property real margin: 5
  readonly property real spacing: 10
  readonly property font font: ({
      family: "JetBrains Mono",
      pointSize: 10
  })

  Variants {
    model: Quickshell.screens

    PanelWindow { // Background
      // This magically makes it appear on all monitors, no idea how and why
      required property var modelData
      screen: modelData

      color: "transparent"
      implicitHeight: root.barHeight
      anchors {
        top: true
        left: true
        right: true
      }

      Workspaces {}

      Titlebar {}

      RowLayout {
        anchors.right: parent.right
        spacing: root.spacing

        Audio {}
        Battery {}
        Internet {}
        SystemTray {}
        DateAndTime {}
      }
    }
  }
}

import Quickshell.Io
import QtQuick
import QtQuick.Layouts

Rectangle {
  id: rect
  property real percent
  property bool isCharging

  color: "red"
  Layout.preferredWidth: batteryText.implicitWidth + root.margin * 3
  Layout.preferredHeight: root.barHeight - root.margin * 2

  Process {
    command: ["sh", "-c", "acpi -b | tail -n 1 | cut -d ' ' -f4 | tr -d '%,'"]
    running: true
    stdout: StdioCollector {
      onStreamFinished: rect.percent = this.text
    }
  }

  Process {
    command: ["sh", "-c", "acpi -b | tail -n 1 | cut -d ' ' -f3 | tr -d ','"]
    running: true
    stdout: StdioCollector {
        onStreamFinished: {
            if (this.text == "Discharging") {
                rect.isCharging = false
            } else if (this.text == "Charging") {
                rect.isCharging = true
            }
        }
    }
  }

  Text {
    id: batteryText
    color: rect.isCharging ? "green" : "orange"
    anchors.centerIn: parent
    text: rect.percent + "%"
  }
}

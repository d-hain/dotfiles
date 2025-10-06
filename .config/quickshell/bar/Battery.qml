import Quickshell.Io
import QtQuick

BarRectangle {
  id: rect
  property real percent
  property bool isDischarging

  rightBorder: true

  Process {
    command: ["sh", "-c", "acpi -b | tail -n 1 | cut -d ' ' -f4 | tr -d '%,'"]
    running: true
    onRunningChanged: if (!this.running) this.running = true
    stdout: StdioCollector {
      onStreamFinished: rect.percent = this.text
    }
  }

  Process {
    command: ["sh", "-c", "acpi -b | tail -n 1 | cut -d ' ' -f3 | tr -d ','"]
    running: true
    onRunningChanged: if (!this.running) this.running = true
    stdout: StdioCollector {
        onStreamFinished: {
            if (this.text == "Discharging") {
                rect.isDischarging = true
            } else {
                rect.isDischarging = false
            }
        }
    }
  }

  textColor: rect.isDischarging ? "red" : Colors.green
  text: "BAT " + rect.percent + "%"
}

import Quickshell.Io
import Quickshell.Hyprland
import QtQuick

BarRectangle {
  id: rect

  anchors.centerIn: parent

  Process {
    command: ["sh", "-c", "hyprctl activewindow | rg title: | tail -n 1 | sed 's#\\s\\+title: ##' | tr -d '\n'"]
    running: true
    onRunningChanged: if (!this.running) this.running = true

    stdout: StdioCollector {
      onStreamFinished: rect.text = this.text
    }
  }
}

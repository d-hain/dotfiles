import Quickshell.Io
import QtQuick

BarRectangle {
  id: rect
  property bool isMuted: false
  property string volume

  rightBorder: true
  color: rect.isMuted ? Colors.bgHighlight : Colors.bg

  Process {
    command: ["sh", "-c", "wpctl get-volume @DEFAULT_SINK@ | cut -d ' ' -f3"]
    running: true
    onRunningChanged: if (!this.running) this.running = true
    stdout: StdioCollector {
        onStreamFinished: rect.isMuted = this.text.trim() == "[MUTED]"
    }
  }

  Process {
    command: ["sh", "-c", "wpctl get-volume @DEFAULT_SINK@ | cut -d ' ' -f2 | tr -d '.\n' | sed 's/^0//'"]
    running: true
    onRunningChanged: if (!this.running) this.running = true
    stdout: StdioCollector {
      onStreamFinished: rect.volume = this.text
    }
  }

  textColor: rect.isMuted ? Colors.purple : Colors.text
  textFont.bold: rect.isMuted
  text: {
    switch (rect.isMuted) {
    case true:  return "[MUTED] " + rect.volume + "%"
    case false: return volumeBar() + rect.volume + "%"
    }
  }
  function volumeBar() {
    const fraction = rect.volume / 25
    return "[" + "=".repeat(fraction).padEnd(4, " ") + "] "
  }

  Process {
      id: pavucontrol
      command: ["pavucontrol"]
  }
  MouseArea {
    anchors.fill: rect
    onClicked: pavucontrol.running = true
  }
}

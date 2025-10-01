import Quickshell.Io
import QtQuick
import QtQuick.Layouts

Rectangle {
  id: rect
  property real percent

  color: "red"
  Layout.preferredWidth: audioText.implicitWidth + root.margin * 3
  Layout.preferredHeight: root.barHeight - root.margin * 2

  Process {
    command: ["sh", "-c", "echo $(($(wpctl get-volume @DEFAULT_SINK@ | cut -d ' ' -f2) * 100)) | tr -d '.'"]
    running: true
    stdout: StdioCollector {
      onStreamFinished: rect.percent = this.text
    }
  }

  Text {
    id: audioText
    anchors.centerIn: parent
    text: rect.percent + "%"
  }
}

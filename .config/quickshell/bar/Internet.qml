import Quickshell.Io
import QtQuick
import QtQuick.Layouts

Rectangle {
  id: rect
  property string ssid
  property string ip

  color: "green"
  Layout.preferredWidth: internetText.implicitWidth + root.margin * 3
  Layout.preferredHeight: root.barHeight - root.margin * 2

  Process {
    command: ["sh", "-c", "nmcli -t -f active,ssid dev wifi | rg '^yes' | cut -d ':' -f2 | tr -d '\n'"]
    running: true
    stdout: StdioCollector {
      onStreamFinished: rect.ssid = this.text
    }
  }

  Process {
    command: ["sh", "-c", "hostname -I | cut -d ' ' -f1 | tr -d '\n'"]
    running: true
    stdout: StdioCollector {
      onStreamFinished: rect.ip = this.text
    }
  }

  Text {
    id: internetText
    anchors.centerIn: parent
    text: rect.ssid + " @ " + rect.ip
  }
}

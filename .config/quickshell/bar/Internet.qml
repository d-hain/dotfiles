import Quickshell.Io
import QtQuick

BarRectangle {
  id: rect
  property bool hasInternet: false
  property string ssid
  property string ip

  rightBorder: true

  Process {
    command: ["sh", "-c", "nmcli -t -f active,ssid dev wifi | rg '^yes' | cut -d ':' -f2 | tr -d '\n'"]
    running: true
    onRunningChanged: if (!this.running) this.running = true
    stdout: StdioCollector {
        onStreamFinished: {
            if (this.text.trim() == "") {
                rect.hasInternet = false
            } else {
                rect.hasInternet = true
                rect.ssid = this.text
            }
        }
    }
  }

  Process {
    command: ["sh", "-c", "hostname -I | cut -d ' ' -f1 | tr -d '\n'"]
    running: true
    onRunningChanged: if (!this.running) this.running = true
    stdout: StdioCollector {
      onStreamFinished: rect.ip = this.text
    }
  }

  text: {
    switch (hasInternet) {
    case true:  return rect.ssid + " @ " + rect.ip
    case false: return "No internet"
    }
  }
}

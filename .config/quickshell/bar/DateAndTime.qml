import Quickshell
import QtQuick
import QtQuick.Layouts

Rectangle {
  required property SystemClock clock
  required property real margin
  required property real barHeight

  readonly property string time: {
    Qt.formatDateTime( clock.date, "hh:mm - dd. MMM" )
  }

  color: "teal"
  Layout.topMargin: this.margin
  Layout.bottomMargin: this.margin
  Layout.rightMargin: this.margin
  Layout.preferredWidth: timeText.implicitWidth + this.margin * 3
  Layout.preferredHeight: this.barHeight

  Text {
    id: timeText
    anchors.centerIn: parent
    text: this.time
  }
}

import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

Rectangle {
  color: "teal"
  Layout.topMargin: root.margin
  Layout.bottomMargin: root.margin
  Layout.rightMargin: root.margin
  Layout.preferredWidth: timeText.implicitWidth + root.margin * 3
  Layout.preferredHeight: root.barHeight - root.margin * 2

  Text {
    id: timeText
    anchors.centerIn: parent
    text: Time.time
  }
}

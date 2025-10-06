import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

// TODO: Calendar on hover

BarRectangle {
  Layout.rightMargin: root.margin
  rightBorder: true

  text: Time.time
  textColor: Colors.green
  textFont.bold: true

  BarRectangle {
    id: tooltip

    visible: false
    anchors.left: parent.left
    // TODO: y position

    text: Time.date
  }

  MouseArea {
    anchors.fill: parent
    hoverEnabled: true

    onEntered: () => {
      tooltip.visible = true
    }
    onExited: () => {
      tooltip.visible = false
    }
  }
}

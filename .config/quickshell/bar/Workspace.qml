import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

BarRectangle {
  id: rect
  property real percent
  property bool isCharging
  property bool isHighlighted
  required property bool isActive
  required property real workspaceId

  Layout.topMargin: root.margin
  Layout.bottomMargin: root.margin
  Layout.leftMargin: root.margin
  implicitWidth: 30 + root.margin * 2
  implicitHeight: root.barHeight - root.margin * 2

  color: {
    if (this.isActive || this.isHighlighted) return Colors.bgHighlight
    return Colors.bg
  }
  border.color: {
      if (this.isActive) return Colors.purple
      return Colors.bgHighlight
  }

  textFont.bold: rect.isHighlighted
  textColor: {
    if (rect.isActive) return Colors.green
    return Colors.text
  }
  text: {
      if (rect.isActive) {
        return yappanese(Hyprland.focusedWorkspace.id)
      } else {
        return yappanese(rect.workspaceId)
      }
  }

  MouseArea {
    anchors.fill: rect
    hoverEnabled: true

    onEntered: () => {
      rect.isHighlighted = true
    }
    onExited: () => {
      rect.isHighlighted = false
    }
    onClicked: () => {
        if (!isActive) {
            Hyprland.dispatch(`workspace ${rect.workspaceId}`)
        }
    }
  }

  function yappanese(id) {
      switch (id) {
      case 1: return "一"
      case 2: return "二"
      case 3: return "三"
      case 4: return "四"
      case 5: return "五"
      case 6: return "六"
      case 7: return "七"
      case 8: return "八"
      case 9: return "九"
      case 0: return "十"
      }
  }

}

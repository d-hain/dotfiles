import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Rectangle {
  property real percent
  property bool isCharging

  color: "gray"
  Layout.topMargin: root.margin
  Layout.bottomMargin: root.margin
  Layout.leftMargin: root.margin
  Layout.preferredWidth: 30 + root.margin * 2
  Layout.preferredHeight: root.barHeight - root.margin * 2

  Text {
      text: {
          const id = Hyprland.activeToplevel.workspace.id
          switch (id) {
            case 1: "一"; break;
            case 2: "二"; break;
            case 3: "三"; break;
            case 4: "四"; break;
            case 5: "五"; break;
            case 6: "六"; break;
            case 7: "七"; break;
            case 8: "八"; break;
            case 9: "九"; break;
            case 0: "十"; break;
          }
      }
    anchors.centerIn: parent
  }
}

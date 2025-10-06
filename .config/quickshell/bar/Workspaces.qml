import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

RowLayout {
  // property HyprlandMonitor monitor: Hyprland.monitorFor(screen)
  anchors.left: root.left
  spacing: root.spacing / 2

  Repeater {
      model: Hyprland.workspaces

      Workspace {
          required property HyprlandWorkspace modelData

          isActive: Hyprland.focusedWorkspace.id == modelData.id
          workspaceId: modelData.id
      }
  }
}

import QtQuick
import QtQuick.Layouts

Rectangle {
  property alias textColor: txt.color
  property alias textFont: txt.font
  property alias text: txt.text
  property bool rightBorder: false

  Layout.topMargin: root.margin
  Layout.bottomMargin: root.margin
  implicitWidth:  txt.implicitWidth + root.margin * 3
  implicitHeight: root.barHeight - root.margin * 2
  color: Colors.bg
  border.color: Colors.bgHighlight
  border.width: 1

  Text {
    id: txt
    anchors.centerIn: parent
    color: Colors.text
    font.family: root.font.family
    font.pointSize: root.font.pointSize
  }

  Rectangle {
    visible: rightBorder
    implicitWidth: 2
    implicitHeight: parent.implicitHeight
    anchors.right: parent.right
    color: Colors.purple
  }
}

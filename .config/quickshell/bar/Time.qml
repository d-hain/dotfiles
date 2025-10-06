pragma Singleton

import Quickshell

Singleton {
    property string time: Qt.formatDateTime(clock.date, "hh:mm")
    property string date: Qt.formatDateTime(clock.date, "dd. MMM")

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}

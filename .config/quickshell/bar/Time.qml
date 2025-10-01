pragma Singleton

import Quickshell

Singleton {
    property string time: Qt.formatDateTime(clock.date, "hh:mm - dd. MMM")

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}

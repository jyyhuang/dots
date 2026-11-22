pragma Singleton
pragma ComponentBehavior: Bound
import QtQuick
import Quickshell

Singleton {
    id: root
    property QtObject colors
    property QtObject bar
    property QtObject font
    property QtObject notifications
    property QtObject icons
    property QtObject wifi
    property QtObject volume
    property QtObject microphone

    colors: Colors {}

    font: QtObject {
        readonly property string fontFamily: "Fira Sans"
        readonly property int fontSize: 16
    }

    bar: QtObject {
        readonly property int height: 44
    }

    notifications: QtObject {
        readonly property int timeout: 5000
    }

    icons: QtObject {
        readonly property string close: ""
        readonly property string arch: ""
        readonly property string idleInhibitorEnabled: " "
        readonly property string idleInhibitorDisabled: ""
        readonly property string power: "󰐥"
        readonly property string batteryCharging: "󰂄"
        readonly property string battery100: "󰁹"
        readonly property string battery90: "󰂂"
        readonly property string battery80: "󰂁"
        readonly property string battery70: "󰂀"
        readonly property string battery60: "󰁿"
        readonly property string battery50: "󰁾"
        readonly property string battery40: "󰁽"
        readonly property string battery30: "󰁼"
        readonly property string battery20: "󰁻"
        readonly property string battery10: "󰁺"
        readonly property string battery0: "󰂎"
        readonly property string memory: " "
        readonly property string notification: ""
    }

    wifi: QtObject {
        readonly property string wifiOff: "󰤮"
        readonly property string wifi100: "󰤨"
        readonly property string wifi75: "󰤥"
        readonly property string wifi50: "󰤢"
        readonly property string wifi25: "󰤟"
        readonly property string wifi0: "󰤯"
    }

    volume: QtObject {
        readonly property string muted: "󰝟"
        readonly property string low: "󰕿"
        readonly property string medium: "󰖀"
        readonly property string high: "󰕾"
    }

    microphone: QtObject {
        readonly property string active: ""
        readonly property string muted: ""
    }
}

import QtQuick
import Quickshell
import qs.Common
import qs.Widgets
import qs.Modules.Plugins

PluginComponent {
    id: root

    layerNamespacePlugin: "timeUntil"

    // settings from pluginData
    property string targetTimestamp: pluginData.targetTimestamp || ""
    property string unit: pluginData.unit || "days"
    property string label: pluginData.label || ""

    property real value: 0

    function recalc() {
        if (!targetTimestamp) {
            value = NaN
            return
        }

        const target = new Date(targetTimestamp.replace("T", " "))
        if (isNaN(target.getTime())) {
            value = NaN
            return
        }
        const now = new Date()
        let diffMs = target.getTime() - now.getTime()

        let divisor
        switch (unit) {
        case "hours": divisor = 1000 * 60 * 60; break
        case "days": divisor = 1000 * 60 * 60 * 24; break
        case "weeks": divisor = 1000 * 60 * 60 * 24 * 7; break
        case "months": divisor = 1000 * 60 * 60 * 24 * 30.44; break
        default: divisor = 1000 * 60 * 60 * 24
        }

        if (diffMs < 0) {
            const raw = Math.abs(diffMs) / divisor
            value = -(Math.round(raw * 10) / 10)
            return
        }

        const raw = diffMs / divisor
        value = Math.round(raw * 10) / 10
    }

    function displayText() {
        if (isNaN(value))
            return targetTimestamp ? "Invalid date" : "No date set"
        const absValue = Math.abs(value)
        const effectiveLabel = value < 0 ? "overdue" : (label && label.trim().length > 0 ? label.trim() : "remaining")
        const display = absValue % 1 === 0 ? absValue.toFixed(0) : absValue.toFixed(1)
        const pluralUnit = absValue === 1 ? unit.slice(0, -1) : unit
        return display + " " + pluralUnit + " " + effectiveLabel
    }

    function shortUnit() {
        switch (unit) {
        case "hours": return "h"
        case "days": return "d"
        case "weeks": return "w"
        case "months": return "mo"
        default: return "d"
        }
    }

    function displayTextShort() {
        if (isNaN(value))
            return targetTimestamp ? "!date" : "—"
        const absValue = Math.abs(value)
        const display = absValue % 1 === 0 ? absValue.toFixed(0) : absValue.toFixed(1)
        const suffix = value < 0 ? "!" : ""
        return display + shortUnit() + suffix
    }

    // Recalculate the remaining time when settings are changed
    onTargetTimestampChanged: recalc()
    onUnitChanged: recalc()
    onLabelChanged: recalc()

    Timer {
        interval: {
            switch (root.unit) {
            case "hours": return 1000 * 60 * 6        // 0.1 hour
            case "days": return 1000 * 60 * 60 * 2.4  // 0.1 day
            case "weeks": return 1000 * 60 * 60 * 24  // 1 day
            case "months": return 1000 * 60 * 60 * 24 // 1 day
            default: return 1000 * 60 * 60 * 2.4
            }
        }
        running: true
        repeat: true
        onTriggered: recalc()
    }

    Component.onCompleted: recalc()

    horizontalBarPill: Component {
        Row {
            spacing: Theme.spacingXS

            StyledText {
                text: displayText()
                font.pixelSize: Theme.fontSizeMedium
            }
        }
    }

    verticalBarPill: Component {
        Column {
            spacing: Theme.spacingXS

            StyledText {
                text: displayTextShort()
                font.pixelSize: Theme.fontSizeMedium
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }

    popoutContent: Component {
        PopoutComponent {
            id: popout

            showCloseButton: false

            StyledText {
                width: parent.width
                readonly property string helpText: "Set the target date in DMS Settings > Plugins > Time Until"
                text: !root.targetTimestamp ? helpText : (root.value < 0 ? "Time since " : "Time until ") + root.targetTimestamp
                font.pixelSize: Theme.fontSizeMedium
                color: Theme.surfaceText
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
            }
        }
    }

    popoutWidth: 250
}
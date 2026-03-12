import QtQuick
import qs.Common
import qs.Widgets
import qs.Modules.Plugins

PluginSettings {
    pluginId: "timeUntil"

    StringSetting {
        label: "Target Date (for example, 2027-01-01 21:37)"
        settingKey: "targetTimestamp"
    }

    SelectionSetting {
        settingKey: "unit"
        label: "Time Units"
        options: [
            { label: "Hours", value: "hours" },
            { label: "Days", value: "days" },
            { label: "Weeks", value: "weeks" },
            { label: "Months", value: "months" }
        ]
        defaultValue: "days"
    }

    StringSetting {
        label: "Label (default: \"remaining\")"
        settingKey: "label"
        placeholder: "until my birthday"
    }
}
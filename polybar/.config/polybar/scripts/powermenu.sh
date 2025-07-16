#!/usr/bin/env bash

# Bloodborne-themed power menu
chosen=$(echo -e "🌙 Lock\n🩸 Logout\n⚔️ Suspend\n🗡️ Reboot\n💀 Shutdown" | rofi -dmenu -i -theme-str '
window {
    width: 20%;
    height: 30%;
}
listview {
    lines: 5;
}
element-text {
    font: "Anonymous Pro 12";
}
' -p "Choose your fate")

case $chosen in
    "🌙 Lock")
        i3lock-fancy
        ;;
    "🩸 Logout")
        i3-msg exit
        ;;
    "⚔️ Suspend")
        systemctl suspend
        ;;
    "🗡️ Reboot")
        systemctl reboot
        ;;
    "💀 Shutdown")
        systemctl poweroff
        ;;
esac
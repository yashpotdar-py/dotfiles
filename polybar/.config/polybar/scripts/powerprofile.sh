#!/usr/bin/env bash

# Power Profile Script for Polybar
# Shows current ASUS power profile and allows toggling

get_current_profile() {
    local profile=$(asusctl profile -p 2>/dev/null | grep -o '\w*' | tail -1)
    case $profile in
        "Balanced")
            echo "BAL"
            ;;
        "Performance")
            echo "PERF"
            ;;
        "Quiet")
            echo "QUIET"
            ;;
        *)
            echo "N/A"
            ;;
    esac
}

toggle_profile() {
    # Get current profile
    local current=$(asusctl profile -p 2>/dev/null | grep -o '\w*' | tail -1)
    
    case $current in
        "Balanced")
            asusctl profile -P Performance >/dev/null 2>&1
            notify-send "🔥 Power Profile" "Switched to Performance" -t 2000
            ;;
        "Performance")
            asusctl profile -P Quiet >/dev/null 2>&1
            notify-send "🌙 Power Profile" "Switched to Quiet" -t 2000
            ;;
        "Quiet")
            asusctl profile -P Balanced >/dev/null 2>&1
            notify-send "⚖️ Power Profile" "Switched to Balanced" -t 2000
            ;;
        *)
            asusctl profile -P Balanced >/dev/null 2>&1
            notify-send "⚖️ Power Profile" "Set to Balanced" -t 2000
            ;;
    esac
}

case $1 in
    --toggle)
        toggle_profile
        ;;
    *)
        get_current_profile
        ;;
esac
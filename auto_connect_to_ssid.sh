#/bin/bash

RED="\033[31m"
GREEN="\033[32m"
END="\033[0m"
BOLD="\033[1m"

TARGET="SSID" #Replace SSID with your SSID target (use: nmcli device wifi list)
CHECK=false
STATUS=false

if sudo -l > /dev/null; then
    while true; do
        ACTUAL=$(nmcli -t -f NAME connection show --active | head -n 1)
        if [ "$ACTUAL" = "$TARGET" ] && [ "$STATUS" = false ]; then
            echo "${BOLD}${GREEN}[$TARGET] Connected.${END}"
            CHECK=true
            STATUS=true
        fi
        if [ "$ACTUAL" != "$TARGET" ]; then
            echo "Checking for $TARGET"
        fi
        while [ "$ACTUAL" != "$TARGET" ]
        do
            if $CHECK; then
                STATUS=false
                echo "${BOLD}${RED}[$TARGET] Disconnected.${END}"
                CHECK=false
            fi
            ACTUAL=$(nmcli -t -f NAME connection show --active | head -n 1)
            if nmcli -t -f SSID dev wifi | grep -q "$TARGET" > /dev/null; then
                if sudo nmcli dev wifi connect "$TARGET" > /dev/null; then
                    CHECK=true
                    break
                else
                    echo "${RED}Impossible to connect to $TARGET${END}"
                    exit
                fi
            fi
            sleep 1
        done
        sleep 2
    done
fi
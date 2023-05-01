#!/bin/bash

function status() {
    if [ "$(nmcli device status | grep wg0 | grep --only-matching 'connected')" == 'connected' ];then
        echo " UP"
    else echo " DOWN"
    fi
}

# need add conection from nmcli
# nmcli connection import type wireguard file wg0.conf
function connect() {
    if [ "$(nmcli device status | grep wg0 | grep --only-matching 'connected')" == 'connected' ];then
        nmcli connection down WireGuard 1>/dev/null 2>&1
    else nmcli connection up WireGuard 1>/dev/null 2>&1
    fi
}

case $1 in
    help)
        usage
        ;;
    status)
        status
        ;;
    connect)
        connect
        ;;
esac




# if [ $(warp-cli status | grep update | cut -d ' ' -f 3) == 'Connected' ];then 
#     warp-cli disconnect 1>/dev/null 2>&1
# else warp-cli connect 1>/dev/null 2>&1
# fi


# echo $(warp-cli status | grep update | cut -d ' ' -f 3)

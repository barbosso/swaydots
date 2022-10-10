#!/bin/bash
if [[ $(nmcli conn show --active | grep tun0) ]]; then echo $(ip addr show tun0 | grep 'inet\b' | awk '{print $2}' | cut -d/ -f1);else echo ""; fi

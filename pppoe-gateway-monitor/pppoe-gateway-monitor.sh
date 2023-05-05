#!/bin/sh

# Define the desired gateway IPs as a space-separated list
desired_gws=""

while true; do
    # Get the gateway IP address for the pppoe0 interface
    current_gw=$(ifconfig pppoe0 | awk '/inet / {print $4}')
    #current_gw=$(netstat -nr | awk '/^default.*pppoe0/ {print $2}')

    # Check if the current gateway IP address is in the desired list of IPs
    if echo "$desired_gws" | grep -qw "$current_gw"; then
        echo "Current gateway IP address $current_gw is already in the desired list of IPs, stopping the script."
        break
    elif echo "$desired_gws" | grep -q "$(echo "$current_gw" | cut -d '.' -f 1-3).0"; then
        echo "Current gateway IP address $current_gw is in the desired IP range, doing nothing."
    else
        echo "Current gateway IP address $current_gw is not in the desired list of IPs, restarting the pppoe0 interface."

        # Stop and start the pppoe0 interface
        /etc/rc.linkup stop pppoe0
        sleep 5
        /etc/rc.linkup start pppoe0
        sleep 10
    fi

    # Wait for a while before retrying
    sleep 10
done
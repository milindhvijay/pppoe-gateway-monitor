# PPPoE Interface Gateway Monitor

This repository contains a bash script that monitors the gateway IP address of the PPPoE interface on a pfSense system. The script checks if the gateway IP address is within the desired list of IPs or IP range. If it's not, the script restarts the PPPoE interface to try and acquire a desired IP address.

This script was created to address an issue with my ISP having poor international routing on some gateways. By ensuring the PPPoE interface uses a gateway from the desired list or IP range, better routing performance can be achieved.


## Usage

* Clone this repository to your pfSense system:

```bash
git clone https://github.com/milindhvijay/pppoe-gateway-monitor.git
```

* Navigate to the cloned directory:

```bash
cd pppoe-gateway-monitor
```

* Make the script executable:

```bash
chmod +x pppoe-gateway-monitor.sh
```

* Update the desired_gws variable in pppoe-gateway-monitor.sh with the desired gateway IP addresses, separated by spaces.

* Run the script with root or administrative privileges:

```bash
./pppoe-gateway-monitor.sh
```

The script will keep running indefinitely, monitoring the pppoe0 gateway IP address and restarting the interface if the gateway is not within the desired list or IP range.

To run the script automatically using a cron job, add the following entry to your pfSense crontab file (replace /path/to/script with the actual path to the script):

```bash
*/5 * * * * root /path/to/script/pppoe-gateway-monitor.sh
```

This will run the script every 5 minutes. Adjust the interval as needed.
## Contributing

Contributions are welcome! Please create a pull request with your proposed changes, and they will be reviewed promptly.


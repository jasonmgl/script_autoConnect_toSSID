# SCRIPT_AUTOCONNECT_TOSSID
This script monitors available Wi-Fi networks and connects to a predefined SSID as soon as it is detected. It leverages the Network Manager command-line tool (nmcli) to manage network connections, providing a seamless way to ensure your device connects to your preferred network automatically.

## USAGE
Clone the Repository:

```bash
git clone https://github.com/jasonmgl/script_autoConnect_toSSID.git
```
Navigate to the Directory:

```bash
cd script_autoConnect_toSSID
```
Modify Script Permissions:

Ensure the script has the appropriate execution permissions:

```bash
chmod +x auto_connect_to_ssid.sh
```
Set the Target SSID:

Edit the auto_connect_to_ssid.sh script to specify your desired SSID:

```bash
TARGET="Your_SSID_Here"
```
Execute the Script:

Run the script to start monitoring and auto-connecting to the specified SSID:

```bash
./auto_connect_to_ssid.sh
```
## DEPENDENCIES
- Network Manager: The script relies on nmcli for network management. Install it using:

```bash
sudo apt install network-manager
```
- Bash: The script is written in Bash and requires a Unix-like environment to execute.

## DESCRIPTIONS
auto_connect_to_ssid.sh: The main script that continuously scans for available Wi-Fi networks and connects to the specified SSID when it is detected. It uses a loop to periodically check for the target SSID and attempts to establish a connection if the network is found.

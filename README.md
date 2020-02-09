# shellies-update

a simple script to find and update your shelly devices over mqtt

## installation

just copy the `shellies` file to your home directory and update the connection information using:
`cp shellies $HOME/.shellies`

change the `MQTT_TIMEOUT` to the period your devices take to broadcast their status

change the `UPDATE_TIMEOUT` to the time between consecutive device updates, so you dont force your devices to update all at once

## execution

run the `updateShellies.sh` using `./updateShellies.sh`

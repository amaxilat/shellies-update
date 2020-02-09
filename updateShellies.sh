#!/bin/bash
source $HOME/.shellies

shellies=$(mosquitto_sub -h $MQTT_HOST -p $MQTT_PORT -u $MQTT_USERNAME:$MQTT_PASSWORD -t "shellies/#" -W $MQTT_TIMEOUT -v | cut -d "/" -f 1,2 | sort | uniq)

echo "Found $(echo $shellies|wc -w) shellies"

for shelly in $shellies
do
        echo "updating $shelly..."
        mosquitto_pub --host $MQTT_HOST --port $MQTT_PORT -t "shellies/$shelly/command" -m "update_fw"
        echo "waiting $UPDATE_TIMEOUT seconds for the update to be completed"
        sleep $UPDATE_TIMEOUT
done
echo "All done!"

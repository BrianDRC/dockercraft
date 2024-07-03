#!/bin/bash

# Reemplaza placeholders en server.properties con valores de las variables de entorno
sed -i "s/\${MOTD}/$MOTD/" /minecraft/server.properties
sed -i "s/\${DIFFICULTY}/$DIFFICULTY/" /minecraft/server.properties
sed -i "s/\${MAX_PLAYERS}/$MAX_PLAYERS/" /minecraft/server.properties
sed -i "s/\${VIEW_DISTANCE}/$VIEW_DISTANCE/" /minecraft/server.properties

# Inicia el servidor de Minecraft con Forge dentro de una sesión de screen
mkdir -p /minecraft/logs
touch /minecraft/logs/server.log
screen -S minecraft -dm bash -c "java -Xmx1024M -Xms1024M -jar forge-1.21-51.0.21-shim.jar nogui > /minecraft/logs/server.log 2>&1"
tail -f /minecraft/logs/server.log

#!/bin/bash

# Verifica si se proporcionó un comando
if [ -z "$1" ]; then
  echo "Uso: $0 '<MC Command>'"
  exit 1
fi

# Envía el comando al proceso de screen del servidor de Minecraft
screen -S minecraft -p 0 -X stuff "$1$(printf \\r)"

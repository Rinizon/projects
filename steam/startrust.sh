#!/bin/sh
clear while : do
  exec ./RustDedicated -batchmode -nographics \
  -server.ip 192.168.50.215 \
  -server.port 28015 \
  -rcon.ip 192.168.50.215 \
  -rcon.port 28016 \
  -rcon.password "Pa$$w0rd12#" \
  -server.maxplayers 100 \
  -server.hostname "Solo | Rinizon's" \
  -server.identity "Solo | Rinizon's" \
  -server.level "Procedural Map" \
  -server.seed 12345 \
  -server.worldsize 3000 \
  -server.saveinterval 300 \-server.globalchat true \
  echo "\nRestarting server...\n" done
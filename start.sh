#!/bin/bash
influxd&
sleep 5
if [ $DB_NAME ]; then
    influx --execute "CREATE DATABASE ${DB_NAME}";
fi
tail -f /var/log/dmesg

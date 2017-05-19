#!/bin/bash
influxd&
sleep 5
if [ $DB_NAME ]; then
    influx --execute "CREATE DATABASE ${DB_NAME}";
    influx --execute "CREATE RETENTION POLICY default_policy ON ${DB_NAME} DURATION ${DAYS_TO_RETAIN}d REPLICATION 1 DEFAULT";
fi
tail -f /var/log/dmesg

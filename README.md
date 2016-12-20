rpi-influxdb
============

InfluxDB container that works on Raspberry Pi. You may optionally specify a default database to be created upon initialization by setting the DB_NAME environment variable.

To use:
-----
`docker run -d -e DB_NAME=db eamonford/rpi-influxdb`

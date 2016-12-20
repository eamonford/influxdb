FROM resin/rpi-raspbian

ADD https://repos.influxdata.com/influxdb.key influxdb.key
COPY start.sh .

RUN apt-get update && apt-get install apt-transport-https
RUN apt-key add influxdb.key
RUN echo "deb https://repos.influxdata.com/debian jessie stable" | tee /etc/apt/sources.list.d/influxdb.list
RUN apt-get update && apt-get install -y influxdb

EXPOSE 8086 8083

ENTRYPOINT ["bash", "./start.sh"]

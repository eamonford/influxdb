FROM resin/rpi-raspbian
RUN apt-get update && apt-get install curl && apt-get install apt-transport-https && \
    curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add - && \
    sudo -s source /etc/os-release && \
    test $VERSION_ID="7" && \
    echo "deb https://repos.influxdata.com/debian wheezy stable" | sudo tee /etc/apt/sources.list.d/influxdb.list && \
    test $VERSION_ID="8" && \
    echo "deb https://repos.influxdata.com/debian jessie stable" | sudo tee /etc/apt/sources.list.d/influxdb.list && \
    apt-get update && apt-get install -y influxdb
EXPOSE 8086 8083
ENTRYPOINT influxd &

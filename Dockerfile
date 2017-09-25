FROM resin/rpi-raspbian:jessie

RUN apt-get update && apt-get -y install apt-transport-https wget ca-certificates apt-utils \
    && wget https://homegear.eu/packages/Release.key && apt-key add Release.key && rm Release.key \
    && echo 'deb https://homegear.eu/packages/Raspbian/ jessie/' >> /etc/apt/sources.list.d/homegear.list \
    && apt-get update && apt-get -y install homegear homegear-homematicbidcos homegear-homematicwired homegear-insteon homegear-max homegear-philipshue homegear-sonos homegear-kodi homegear-ipcam homegear-beckhoff homegear-knx homegear-enocean homegear-intertechno \
    && cp -R /etc/homegear /etc/homegear.config \
    && cp -R /var/lib/homegear /var/lib/homegear.data \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/etc/homegear", "/var/lib/homegear", "/var/log/homegear"]

COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD /start.sh

EXPOSE 2001 2002 2003


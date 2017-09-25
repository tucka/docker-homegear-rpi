# docker-homegear-rpi
Homegear Docker image for Raspberry Pi

Run Docker:

docker run --restart=always -d -v /opt/homegear/etc:/etc/homegear -v /opt/homegear/lib:/var/lib/homegear -v /opt/homegear/log:/var/log/homegear -p 2001:2001 -p 2002:2002 -p 2003:2003 --device=/dev/ttyACM0 --name homegear homegear/homegear:stable

Open Homegear shell:

docker exec -it homegear homegear -r

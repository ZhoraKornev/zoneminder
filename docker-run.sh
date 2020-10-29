#!/bin/bash

docker stop zoneminder_docker --force

docker run -d --name="zoneminder_docker" \
--net="bridge" \
--privileged="true" \
-p 8080:80/tcp \
-p 9000:9000/tcp \
-e TZ="Europe/Kyiv" \
-e SHMEM="50%" \
-e PUID="99" \
-e PGID="100" \
-e INSTALL_HOOK="0" \
-e INSTALL_FACE="0" \
-e INSTALL_TINY_YOLOV3="0" \
-e INSTALL_YOLOV3="0" \
-e INSTALL_TINY_YOLOV4="0" \
-e INSTALL_YOLOV4="0" \
-e MULTI_PORT_START="0" \
-e MULTI_PORT_END="0" \
-v "/mnt/cache/appdata/Zoneminder":"/config":rw \
-v "/mnt/cache/appdata/Zoneminder/data":"/var/cache/zoneminder":rw \
dlandon/zoneminder

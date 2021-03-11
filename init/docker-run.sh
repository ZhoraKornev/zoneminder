#!/bin/bash

docker stop zoneminder_docker --force

docker run -d --name="zoneminder_docker" \
--net="bridge" \
--privileged="true" \
-p 8080:80/tcp \
-p 9000:9000/tcp \
-e TZ="Europe/Kiev" \
-e SHMEM="50%" \
--privileged="false" \
--shm-size="8G" \
-e PUID="99" \
-e PGID="100" \
-e MULTI_PORT_START="0" \
-e MULTI_PORT_END="0" \
-v "/mnt/cache/appdata/Zoneminder":"/config":rw \
-v "/mnt/cache/appdata/Zoneminder/data":"/var/cache/zoneminder":rw \
dlandon/zoneminder.machine.learning

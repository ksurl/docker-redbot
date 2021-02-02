# Docker image for [RedBot](https://github.com/Cog-Creators/Red-DiscordBot)

[![](https://img.shields.io/badge/Docker%20Hub--blue)](https://hub.docker.com/r/ksurl/redbot) [![](https://img.shields.io/badge/GitHub%20Container%20Registry--yellow)](https://github.com/users/ksurl/packages/container/package/redbot)

[![](https://img.shields.io/github/v/tag/ksurl/docker-redbot?label=image%20version&logo=docker)](https://hub.docker.com/r/ksurl/redbot) [![](https://img.shields.io/docker/image-size/ksurl/redbot/latest?color=lightgrey&logo=Docker)]() [![](https://img.shields.io/github/workflow/status/ksurl/docker-redbot/build?label=build&logo=Docker)](https://github.com/ksurl/docker-redbot/actions?query=workflow%3Abuild)

* Based on python:alpine
* git
* openjdk11

# Usage

## docker cli

    docker run -d \
        --name=redbot \
        -v <CONFIG_FOLDER>:/config \
        -e PUID=1000
        -e PGID=1000
        -e INSTANCE=<INSTANCE_NAME>
        ksurl/redbot:latest \

## docker-compose 

    version: "3.8"
    services:
      redbot:
        image: ksurl/redbot:latest
        container_name: redbot
        # 1st run setup needs to be run manually by attaching to container as runtime user
        #command: ['tail', '-f', '/dev/null' ]
        environment:
          - PUID=1000
          - PGID=1000
          - INSTANCE=docker # change to your instance name
        volumes:
          - redbot-data:/config # set path according to redbot-setup 1st run
        restart: unless-stopped

## Parameters

| Parameter | Function | Default |
| :----: | --- | --- |
| `-e PUID` | Set uid | `1000` |
| `-e PGID` | Set gid | `1000` |
| `-e INSTANCE` | Set instance name | `docker` |

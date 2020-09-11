# Docker image for [RedBot](https://github.com/Cog-Creators/Red-DiscordBot)

* Based on python:alpine
* git
* openjdk11

Defaults to 1000 for UID

# Usage

## docker cli

    docker run -d \
        --name=CONTAINER_NAME \
        -v VOLUME_NAME:/config \
        -e UID=1000
        -e GID=1000
        -e INSTANCE=INSTANCE_NAME
        ksurl/redbot:latest \

## docker-compose 

    version: "2"
    services:
    redbot:
      image: ksurl/redbot:latest
      container_name: redbot
      # 1st run setup needs to be run manually by attaching to container as runtime user
      #command: ['tail', '-f', '/dev/null' ]
      command: ['/bin/sh', '-c', "/usr/local/bin/redbot $INSTANCE" ]
      environment:
        - UID=1000
        - GID=1000
        - INSTANCE=docker # change to your instance name
      volumes:
        - redbot-data:/config # set path according to redbot-setup 1st run
      restart: unless-stopped

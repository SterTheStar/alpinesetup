#!/bin/sh
cp /etc/apk/repositories /etc/apk/repositories.bak
echo "http://dl-cdn.alpinelinux.org/alpine/v3.18/community" >> /etc/apk/repositories
apk update
apk add bash sudo
echo "Repositório community adicionado e pacotes instalados."

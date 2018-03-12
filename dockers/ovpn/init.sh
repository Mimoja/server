#!/bin/bash

docker-compose run --rm openvpn ovpn_genconfig -c -u udp://mimoja.de
docker-compose run --rm openvpn ovpn_initpki


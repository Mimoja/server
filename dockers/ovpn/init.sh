#!/bin/bash

docker-compose run --rm openvpn ovpn_genconfig -u udp://vpn.mimoja.de
docker-compose run --rm openvpn ovpn_initpki


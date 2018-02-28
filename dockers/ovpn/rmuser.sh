#!/bin/bash
export CLIENTNAME=$1
docker-compose run --rm openvpn ovpn_revokeclient $CLIENTNAME remove

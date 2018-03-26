#!/bin/sh

rm -r tinc-data/*

docker-compose run --entrypoint "sh -c" tinc "tinc -n Mimoja init server"
docker-compose run --entrypoint "sh -c" tinc "tinc -n Mimoja generate-keys 4096"
docker-compose run --entrypoint "sh -c" tinc "tinc -n Mimoja add subnet 10.0.0.0/24"
echo 'ip addr add 10.0.1.1/24 dev $INTERFACE' > tinc-data/Mimoja/tinc-up
echo 'ip link set $INTERFACE up' >> tinc-data/Mimoja/tinc-up

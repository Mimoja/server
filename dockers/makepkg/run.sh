#!/bin/bash

sudo docker build -t makepkg .
sudo docker run $(pwd)/packages:/packages makepkg:latest $@

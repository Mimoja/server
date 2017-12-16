#!/bin/bash

sudo docker build -t makepkg .
sudo docker run -v $(pwd)/packages:/packages makepkg:latest $@

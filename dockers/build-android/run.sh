#!/bin/bash

sudo docker run -v $(pwd)/ccache:/ccache -v $(pwd)/android:/aosp android-build:latest $@

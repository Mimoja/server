#!/bin/bash

source build/envsetup.sh
lunch $@

if (( "$#" != 0 ))
then
 make -j16
fi

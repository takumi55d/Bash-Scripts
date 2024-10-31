#!/bin/bash
ssh -L 5901:localhost:5901 -N -f sr@172.105.59.109
vncviewer localhost:5901 &

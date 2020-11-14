# DESCRIPTION:	  Run Windows 95 in a container
# AUTHOR:		  Paul DeCarlo <toolboc@gmail.com>
#
#   Made possible through prior art by:
#   copy (v86 - x86 virtualization in JavaScript) 
#   felixrieseberg (Windows95 running in electron) 
#   Microsoft (Windows 95)
#
#   ***Docker Run Command***
#
#   docker run -it \
#    -v /tmp/.X11-unix:/tmp/.X11-unix \ # mount the X11 socket
#    -e DISPLAY=unix$DISPLAY \ # pass the display
#    --device /dev/snd \ # sound
#    --name windows95 \
#    toolboc/windows95
#
#   ***TroubleShooting***
#   If you receive Gtk-WARNING **: cannot open display: unix:0
#   Run:
#       xhost +
#

FROM ubuntu:latest

RUN echo hello

RUN wget https://github.com/felixrieseberg/windows95/releases/download/v2.2.2/windows95_2.2.2_amd64.deb

RUN sudo dpkg -i windows95_2.2.2_amd64.deb

ENTRYPOINT [ "windows95" ]

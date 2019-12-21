FROM  netbootxyz/mod-layers:ubuntu-18.04
COPY /root /
ENTRYPOINT [ "/build.sh" ]

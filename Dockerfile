FROM ghcr.io/netbootxyz/mod-layers:ubuntu-20.04
COPY /root /
ENTRYPOINT [ "/build.sh" ]

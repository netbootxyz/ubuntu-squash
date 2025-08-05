FROM ghcr.io/netbootxyz/mod-layers:ubuntu-25.04
COPY /root /
ENTRYPOINT [ "/build.sh" ]

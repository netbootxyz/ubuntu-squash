FROM  ghcr.io/netbootxyz/mod-layers:ubuntu-23.04
COPY /root /
ENTRYPOINT [ "/build.sh" ]

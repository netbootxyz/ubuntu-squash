FROM  ghcr.io/netbootxyz/mod-layers:ubuntu-21.04
COPY /root /
ENTRYPOINT [ "/build.sh" ]

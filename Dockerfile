FROM  ghcr.io/netbootxyz/mod-layers:ubuntu-22.04
COPY /root /
ENTRYPOINT [ "/build.sh" ]

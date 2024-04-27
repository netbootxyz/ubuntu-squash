FROM  ghcr.io/netbootxyz/mod-layers:ubuntu-24.04
COPY /root /
ENTRYPOINT [ "/build.sh" ]

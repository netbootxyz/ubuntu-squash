FROM  ghcr.io/netbootxyz/mod-layers:ubuntu-23.10
COPY /root /
ENTRYPOINT [ "/build.sh" ]

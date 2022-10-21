FROM  ghcr.io/netbootxyz/mod-layers:ubuntu-22.10
COPY /root /
ENTRYPOINT [ "/build.sh" ]

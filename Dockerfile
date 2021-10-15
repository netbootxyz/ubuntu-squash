FROM  ghcr.io/netbootxyz/mod-layers:ubuntu-21.10
COPY /root /
ENTRYPOINT [ "/build.sh" ]

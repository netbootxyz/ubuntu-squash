FROM  ghcr.io/netbootxyz/mod-layers:debian-10
COPY /root /
ENTRYPOINT [ "/build.sh" ]

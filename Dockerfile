FROM  netbootxyz/mod-layers:debian-10
COPY /root /
ENTRYPOINT [ "/build.sh" ]

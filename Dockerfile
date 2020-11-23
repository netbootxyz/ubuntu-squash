FROM  netbootxyz/mod-layers:ubuntu-20.10
COPY /root /
ENTRYPOINT [ "/build.sh" ]

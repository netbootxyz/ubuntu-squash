FROM  netbootxyz/mod-layers:ubuntu-19.10
COPY /root /
ENTRYPOINT [ "/build.sh" ]

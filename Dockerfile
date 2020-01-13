FROM  netbootxyz/mod-layers:ubuntu-18.04
COPY /root /
RUN \
 mkdir -p /modlayer/usr && \
 mv /modlayer/bin /modlayer/usr/
ENTRYPOINT [ "/build.sh" ]

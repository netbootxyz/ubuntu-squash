FROM  netbootxyz/mod-layers:ubuntu-18.04
COPY /root /
RUN \
 mkdir -p \
	/modlayer/etc/dhcp/dhclient-enter-hooks.d && \
 mv \
	/dhclientconfig \
	/modlayer/etc/dhcp/dhclient-enter-hooks.d/config
ENTRYPOINT [ "/build.sh" ]

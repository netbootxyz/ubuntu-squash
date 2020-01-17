FROM  netbootxyz/mod-layers:ubuntu-18.04
COPY /root /
RUN \
 mkdir -p \
	/modlayer/usr \
	/modlayer/etc/dhcp/dhclient-enter-hooks.d && \
 mv \
	/dhclientconfig \
	/modlayer/etc/dhcp/dhclient-enter-hooks.d/config &&
 mv \
	/modlayer/bin \
	/modlayer/usr/

ENTRYPOINT [ "/build.sh" ]

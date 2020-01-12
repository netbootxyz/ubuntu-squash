URL="http://downloads.pureos.net/amber/live/gnome/REPLACE_VERSION/pureos-9.0-gnome-live_$(echo REPLACE_VERSION| sed 's/-//g')-amd64.hybrid.iso"
TYPE=file
CONTENTS="\
casper/filesystem.squashfs|filesystem.squashfs
casper/initrd.img|initrd
casper/vmlinuz|vmlinuz"
EXTRACT_INITRD="true"
INITRD_NAME="initrd"
INITRD_TYPE="gz"

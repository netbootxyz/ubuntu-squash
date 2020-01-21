URL="https://downloads.sourceforge.net/project/lxle/Final/OS/REPLACE_VERSION-64/lxle-$(echo REPLACE_VERION | sed 's/\.//g' )-64.iso"
TYPE=file
CONTENTS="\
casper/filesystem.squashfs|filesystem.squashfs
casper/initrd.lz|initrd
casper/vmlinuz|vmlinuz"
EXTRACT_INITRD="true"
INITRD_NAME="initrd"
INITRD_TYPE="gz"

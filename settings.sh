URL="https://cdimage.ubuntu.com/releases/mantic/release/ubuntu-REPLACE_VERSION-desktop-legacy-amd64.iso"
TYPE=file
CONTENTS="\
casper/vmlinuz|vmlinuz
casper/initrd|initrd
casper/minimal.standard.squashfs|filesystem.squashfs"
EXTRACT_INITRD="true"
INITRD_NAME="initrd"
INITRD_TYPE="zstd"

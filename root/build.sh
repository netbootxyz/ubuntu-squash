#! /bin/bash

# Apply network boot patches to the extracted initrd
# Note: iso-processor handles multi-layer initrd extraction (microcode, drivers, main initramfs)

cd /buildout

# Copy network boot patches over the extracted initrd
rsync -a /modlayer/ /buildout/initrd_files/

exit 0

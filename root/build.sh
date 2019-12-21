#! /bin/bash

# copy mod layer to unextracted initrd
rsync -a /modlayer/ /buildout/initrd_files/

exit 0

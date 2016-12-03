#!/bin/bash

#
# Backs up all the content of my password store to the location given as an argument
#
# Maintainer: Etienne Lafarge
#

tar -cz ~/.password-store \
    | gpg --sign --encrypt -r etienne.lafarge@gmail.com \
    > "$1"

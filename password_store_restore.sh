#!/bin/bash

#
# Backs up all the content of my password store to the location given as an argument
#
# Maintainer: Etienne Lafarge
#

gpg --decrypt \
    < "$1" \
    | tar -xz

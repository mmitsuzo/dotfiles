#!/bin/sh

SRCDIR="${HOME}/.local/src"
ZIPURL="https://github.com/neovim/neovim/releases/download/stable/nvim-win64.zip"
ZIPFILE="${SRCDIR}/nvim-win64.zip"

curl --create-dirs -L -o "${ZIPFILE}" "${ZIPURL}" && unzip -d "${SRCDIR}" "${ZIPFILE}"


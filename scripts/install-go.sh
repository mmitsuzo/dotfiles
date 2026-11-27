#!/bin/sh

SRCDIR="${HOME}/.local/src"
TARGET="go1.27.4.windows-amd64.zip"
ZIPURL="https://go.dev/dl/${TARGET}"
ZIPFILE="${SRCDIR}/${TARGET}"

curl --create-dirs -L -o "${ZIPFILE}" "${ZIPURL}" && unzip -d "${SRCDIR}" "${ZIPFILE}"


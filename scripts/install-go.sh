#!/bin/sh

SRCDIR="${HOME}/.local/src"
VERSION="1.27.4"
TARGET="go${VERSION}.windows-amd64.zip"
ZIPURL="https://go.dev/dl/${TARGET}"
ZIPFILE="${SRCDIR}/${TARGET}"

curl --create-dirs -L -o "${ZIPFILE}" "${ZIPURL}" && unzip -d "${SRCDIR}" "${ZIPFILE}"


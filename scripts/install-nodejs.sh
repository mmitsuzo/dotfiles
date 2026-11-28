#!/bin/sh

SRCDIR="${HOME}/.local/src"
VERSION="26.13.1"
TARGET="node-v${VERSION}-win-x64.zip"
ZIPURL="https://nodejs.org/dist/v${VERSION}/${TARGET}"
ZIPFILE="${SRCDIR}/${TARGET}"

curl --create-dirs -L -o "${ZIPFILE}" "${ZIPURL}" && unzip -d "${SRCDIR}" "${ZIPFILE}"


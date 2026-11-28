#!/bin/sh

SRCDIR="${HOME}/.local/src"
VERSION="2.56.1"
WINBUILD="1"
TARGET="PortableGit-${VERSION}-64-bit.7z.exe"
ZIPURL="https://nodejs.org/dist/${VERSION}/${TARGET}"
ZIPFILE="${SRCDIR}/${TARGET}"

curl --create-dirs -L -o "${ZIPFILE}" "${ZIPURL}" && unzip -d "${SRCDIR}" "${ZIPFILE}"


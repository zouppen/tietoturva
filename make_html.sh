#!/bin/bash

RST2XML=rst2xml-2.6.py
XSLTPROC=xsltproc

if [[ ! -e "$1" ]]; then
    echo "Source file doesn't exist."
    echo "Usage $0 source.rst"
    exit 1
fi

IN_RST=$1
BASENAME=$(basename "$IN_RST" .rst)
OUT_XML=$BASENAME.xml
OUT_HTML=$BASENAME.html

echo $IN_RST
echo $OUT_XML
echo $OUT_HTML

$RST2XML "$IN_RST" "$OUT_XML"
$XSLTPROC --novalid -o "$OUT_HTML" s5convert.xsl "$OUT_XML"
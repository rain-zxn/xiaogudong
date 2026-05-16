#!/bin/bash
cat index.html | \
  tr '\n' ' ' | \
  sed 's/<!--.*-->//g' | \
  sed 's/  */ /g' | \
  sed 's/> *</></g' | \
  sed 's/ *{ */{/g' | \
  sed 's/ *} */}/g' | \
  sed 's/ *( */(/g' | \
  sed 's/ *) */)/g' | \
  sed 's/ *; */;/g' | \
  sed 's/ *, */,/g' | \
  sed 's/ *= */=/g' | \
  sed 's/ *: */:/g' | \
  sed 's/| |//g' > index_compressed.html

mv index_compressed.html index.html

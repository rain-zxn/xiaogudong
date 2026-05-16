#!/bin/bash
# 提取 script 标签前的内容
sed -n '1,360p' index.html > index_new.html

# 提取并压缩 script 内容
echo "    <script>" >> index_new.html
sed -n '362,991p' index.html | \
  sed 's|//.*$||g' | \
  tr '\n' ' ' | \
  sed 's/  */ /g' | \
  sed 's/ *{ */{/g' | \
  sed 's/ *} */}/g' | \
  sed 's/ *( */(/g' | \
  sed 's/ *) */)/g' | \
  sed 's/ *; */;/g' | \
  sed 's/ *, */,/g' | \
  sed 's/ *= */=/g' >> index_new.html

# 添加结束标签
echo "</script>" >> index_new.html
echo "</body>" >> index_new.html  
echo "</html>" >> index_new.html

mv index_new.html index.html

#!/bin/bash

# 首字母转换为大写
toFirstLetterUpper(){
  str=$1
  firstLetter=${str:0:1}
  otherLetter=${str:1}
  firstLetter=$(echo $firstLetter | tr '[a-z]' '[A-Z]')
  result=$firstLetter$otherLetter
}

toFirstLetterUpper1(){
  str=$1
  firstLetter=${str:0:1}
  otherLetter=${str:1}
  firstLetter=$(echo $firstLetter | tr '[:lower:]' '[:upper:]')
  result=$firstLetter$otherLetter
}

# 首字母转换为大写
toFirstLetterUpper2() {
  str=$1
  firstLetter=`echo ${str:0:1} | awk '{print toupper($0)}'`
  otherLetter=${str:1}
  result=$firstLetter$otherLetter
}


# ${var#*/}  最小限度从前面截取字符串，分隔符/
# ${var##*/}  最大限度从前面截取字符串，分隔符/
# ${var%/*} 最小限度从后面截取字符串，分隔符/
# ${var%%/*} 最大限度从后面截取字符串，分隔符/
# ${var:start:len} 截取字符串，从start位置开始（最小为0），len是截取长度
# ${var:start}
# ${var:0-start:len} 从右边开始算，第start个字符开始，len是截取长度
# ${var:0-start}

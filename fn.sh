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


toFirstLetterUpper1 eco

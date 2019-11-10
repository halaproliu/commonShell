#!/bin/bash

# 首字母转换为大写
toFirstLetterUpper(){
  str=$1
  firstLetter=${str:0:1}
  otherLetter=${str:1}
  firstLetter=$(echo $firstLetter | tr '[a-z]' '[A-Z]')
  result=$firstLetter$otherLetter
}

toFirstLetterUpper 'eco'
echo $result

#!/bin/bash
# 打印home目录下的web目录文件列表
cd $HOME/web
for file in `ls`
do
  echo $file
done
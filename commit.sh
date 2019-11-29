#!/bin/bash
source `pwd`/.env
hasGit=`which git` #判断是否已安装git
if [ ! $hasGit ];then
  echo 'Please download git first!';
  exit 1;
else 
  # 获取当前分支
  branch=`git branch | grep "*"`
  # 截取分支名
  currBranch=${branch:2}
  msg="title:$a;content:$b;$1"
  msg=`echo $msg | sed -e 's/;/\'$'\n/g'`
  echo $msg
  git add .
  git commit -m "$msg"
  git push origin $currBranch
fi

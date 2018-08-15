#!/bin/bash
# import color.sh
. color.sh
index=0
# web前端工程目录
web=$HOME/web
# packages目录
packages=$web/packages
download=$HOME/Downloads

# 显示project列表
getWebFileList(){
  cd $web
  log 5 "Please choose one project:"
  # 遍历当前web工程目录
  for file in `ls`
  do
    # 文件列表存入数组
    fileList[$index]=$file
    # 数组下标加1
    index=`expr $index + 1`
    # 显示数字+列表
    # eg. 1.PAEBankV3_iOSClient
    echo "$index.$file"
  done
}
# 选择project
selectProject(){
  # 读取选项number
  read selectIndex
  if [ $((selectIndex)) -gt 0 ];
  then
    # 数组是从0开始，所以输入数字减1
    selectIndex=`expr $selectIndex - 1`
    # 回显选中选项提示
    log 6 "you have selected ${fileList[selectIndex]} project!"
    return $selectIndex
  else
    log 1 "Please Input right number!"
    exit 1;
  fi
}

getWebFileList
selectProject

if test -f "$download/${fileList[selectIndex]}.zip"
then
  log 6 "Has found $download/${fileList[selectIndex]}.zip"
else
  log 1 "$download/${fileList[selectIndex]}.zip file is not exist"
  exit 1;
fi

log 5 "----------start update packages project code-------------"
cd $packages
git pull
mv "$download/${fileList[selectIndex]}.zip" "$packages"
git commit -am 'update'
# git push
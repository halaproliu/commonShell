#!/bin/bash
# import color.sh
. color.sh

index=0
# web前端工程目录
web=$HOME/web
# packages目录
packages=$web/packages

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

# 打包文件并移动到packages目录
pullAndMove(){
  #############################选中项目文件打包并拷贝到packages工程目录####################################
  # 进入选中的项目目录
  cd "$web/${fileList[selectIndex]}"
  # 拉去最新git代码
  git pull
  # 打包离线包
  gulp offline --dev
  # 进入打包完成的prd目录
  cd "$web/${fileList[selectIndex]}/dist/offline/prd"
  # 对prd目录进行zip压缩
  zip -r -o "${fileList[selectIndex]}.zip" assets config pages scripts templates
  # 进入packages项目目录
  cd $packages
  # 拉去packages最新git代码
  git pull
  # 移动压缩的zip包到packages项目
  mv "$web/${fileList[selectIndex]}/dist/offline/prd/${fileList[selectIndex]}.zip" "$packages"
  # 提示文件移动结束
  log 6 "The ${fileList[selectIndex]}.zip has been moved to packages project root folder!"
  #####################################################################################################
}

getWebFileList
selectProject
pullAndMove
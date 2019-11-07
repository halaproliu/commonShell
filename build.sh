#!/bin/bash
source .env
#0 黑色
#1 红色
#2 绿色
#3 红色
#4 蓝色
#5 紫色
#6 天蓝色
#7 白色
# param1：选择颜色
# param2：输出的字符串
log(){
  colors=(30 31 32 33 34 35 36 37)
  echo -e "\033[${colors[$1]}m$2\033[0m"
}

folder=$project

# 获取文件夹列表
getList(){
  cd $1
  i=0
  len=`ls | wc -l`
  for key in `ls`
  do
    arr[$i]=$key
    let i=$i+1
    log 2 "$i.$key"
  done
}
# 选中指定项目
selectProject(){
  echo '请选择目录：'
  read selectedIndex
  if [ $((selectedIndex)) -gt 0 ];
  then
    selectedIndex=`expr $selectedIndex-1`
    selectedFolder=${arr[selectedIndex]}
    log 5 "选中$selectedFolder 项目"
    cd $folder/$selectedFolder
  else
    log 1 "请输入正确的数字！"
  fi
}
# 列出操作列表
selectOperation(){
  echo '请选择操作：'
  operList=('xxx' 'xxx' 'xxx')
  operLen=${#operList[*]}
  for((j=0;j<$operLen;j++)){
    let index=$j+1
    log 2 ${index}.${operList[j]}
  }
}
# 执行选项
execOperation(){
  read operIndex
  if [ $((operIndex)) -gt 0 ];
  then
    case $operIndex in
      1)
        gulp offline
        ;;
      2)
        npm run build
        ;;
      3)
        npm run ibank
        ;;
    esac
  else
    log 1 "请输入正确的数字！"
  fi
}

getList $folder
selectProject 
selectOperation
execOperation

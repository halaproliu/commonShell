#!/bin/bash
# import color.sh
. color.sh

index=0
# web前端工程目录
PROJECTS_DIR=$HOME/github

# 显示project列表
function getWebFileList(){
  cd $PROJECTS_DIR
  log 5 "Please choose one project:"
  # 遍历当前web工程目录
  for file in `ls`
  do
    # 文件列表存入数组
    fileList[$index]=$file
    # 数组下标加1
    index=`expr $index + 1`
    # 显示数字+列表
    echo "$index.$file"
  done
}
# 选择project
function selectProject(){
  # 读取选项number
  read selectIndex
  if [ $((selectIndex)) -gt 0 ];
  then
    # 数组是从0开始，所以输入数字减1
    selectIndex=`expr $selectIndex - 1`
    # 回显选中选项提示
    log 6 "you have selected ${fileList[selectIndex]} project!"
    update $PROJECTS_DIR/${fileList[selectIndex]}
  elif [ -z $selectIndex ];then
    update_all
  else
    log 1 "Please Input right number!"
    exit 1;
  fi
}

# 判断是否是git目录
function is_git_dir(){
    param=`find $PWD -name ".git"`
    if [ $param ];then
        return 0
    else
        return 1
    fi
}

# 更新所有git目录
function update_all(){
    cd $PROJECTS_DIR
    for dir in `ls`
    do
        log 6 "$dir"
        if [ -d "$PROJECTS_DIR/$dir" ];then
            cd $PROJECTS_DIR/$dir
            if is_git_dir;then
                git pull
                # sleep 5
                log 2 "update success ^_^\n"
            else 
                log 1 "$PWD is not a git dir\n"
            fi
        else
            log 1 "$dir is not a directory"
        fi
    done
}

# 更新指定目录
function update(){
    cd $1
    if is_git_dir;then
        git pull
        # sleep 5
        log 2 "update success ^_^\n"
    else 
        log 1 "$PWD is not a git dir\n"
    fi
}

getWebFileList
selectProject


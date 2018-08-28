#!/bin/sh

#Author beichenwenxin https://github.com/beichenwenxin/shell/blob/master/lftp_file.sh
#Create on Tue Aug 28 09:39:44 2018

#本地存放日志的目录
LOG=${HOME}/log/

#本地文件名
FILE=file.log

LOGFILE=${LOG}${FILE}
>$LOGFILE

#修改FTP的IP 用户 密码
FTPIP=36.0.1.217
FTPUSER=test
FTPPASSWORD=Test@2019

#取日期
MYDATE=`date +%Y-%m-%d`

#取时间
MYTIME=`date +%H:%M:%S`

#取空间百分比 用时修改sda3
m1=`df -lh|grep sda3 |awk '{print $5}'`


echo "$MYDATE $MYTIME---->DBServer Diskspace|${m1}" >> $LOGFILE

lftp -u ${FTPUSER},${FTPPASSWORD} sftp://${FTPIP} <<!

lcd ${HOME}/log
put ${FILE}
bye
!

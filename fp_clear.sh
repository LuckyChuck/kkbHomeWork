#!/bin/bash
#---------------------------------------------------------
#清理hdfs7日前表及数据
#---------------------------------------------------------

source /home/ap/ghd/bigdata_env.sh #生效大数据配置文件


if [ $# -eq 0 ] ; then
   SEVEN_DAYS_AGO=`date -d -7day +"%Y%m%d"` #默认7天前时间
   else
   SEVEN_DAYS_AGO=$1
fi

HADOOP_CMD=${HADOOP_HOME}/bin/hadoop
TABLE_ARRAY=(    #需要清理的表名
a_yn_test
)

TABLE_ARRAY_COUNT=${#TABLE_ARRAY[*]}
echo '一共:'$TABLE_ARRAY_COUNT'个需要清理的表,清理日期位:'$SEVEN_DAYS_AGO

for((i=0;i<${#TABLE_ARRAY[@]};i++)) do
   TABLE_PATH=/user/hive/warehouse/${TABLE_ARRAY[i]}/hdfs_date_dt=${SEVEN_DAYS_AGO}
   echo "准备清理路径:"$TABLE_PATH
   ${HADOOP_CMD} fs -rm -r $TABLE_PATH
   echo "清理路径:"$TABLE_PATH"完成"
done;


for((i=0;i<${#TABLE_ARRAY[@]};i++)) do
   echo "准备清除分区:"$TABLE_PATH"(hdfs_date_dt="${SEVEN_DAYS_AGO}")"
   beeline -e "alter table "${TABLE_ARRAY[i]}" drop partition (hdfs_date_dt='"${SEVEN_DAYS_AGO}"')"
    echo "清除分区:"$TABLE_PATH"(hdfs_date_dt="${SEVEN_DAYS_AGO}") 完成" 
done;

echo 'lala'

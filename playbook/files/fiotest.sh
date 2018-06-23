#!/bin/bash

if [ $# -eq 0 ]; then
  echo "no path define"
  exit
elif [ ! -d $1 ]; then 
  mkdir -p $1
fi

#已挂载好的硬盘使用

fio -filename=/mnt/disk1/fiotestdata -direct=1 -iodepth 1 -thread -rw=randrw -rwmixread=70 -ioengine=psync -bs=16k -size=2G -numjobs=10 -runtime=60 -group_reporting -name=mytest -ioscheduler=noop >> $1/`hostname`_disk1.log &
fio -filename=/mnt/disk2/fiotestdata -direct=1 -iodepth 1 -thread -rw=randrw -rwmixread=70 -ioengine=psync -bs=16k -size=2G -numjobs=10 -runtime=60 -group_reporting -name=mytest -ioscheduler=noop >> $1/`hostname`_disk2.log &
fio -filename=/mnt/disk3/fiotestdata -direct=1 -iodepth 1 -thread -rw=randrw -rwmixread=70 -ioengine=psync -bs=16k -size=2G -numjobs=10 -runtime=60 -group_reporting -name=mytest -ioscheduler=noop >> $1/`hostname`_disk3.log &
fio -filename=/mnt/disk4/fiotestdata -direct=1 -iodepth 1 -thread -rw=randrw -rwmixread=70 -ioengine=psync -bs=16k -size=2G -numjobs=10 -runtime=60 -group_reporting -name=mytest -ioscheduler=noop >> $1/`hostname`_disk4.log &
fio -filename=/mnt/disk5/fiotestdata -direct=1 -iodepth 1 -thread -rw=randrw -rwmixread=70 -ioengine=psync -bs=16k -size=2G -numjobs=10 -runtime=60 -group_reporting -name=mytest -ioscheduler=noop >> $1/`hostname`_disk5.log &

##
#
#没有挂载的硬盘，直接在设备上测试
# vm一般 使用 /dev/vd? 如果使用scsi 则使用 /dev/sd?  
##

#for i in `ls -1 /dev/sd?|awk -F "/" '{print $3}'`; do
# fio -filename=/dev/$i -direct=1 -iodepth 1 -thread -rw=randrw -rwmixread=70 -ioengine=psync -bs=16k -size=2G -numjobs=10 -runtime=60 -group_reporting -name=mytest -ioscheduler=noop >> $1/`hostname`_$i.log &
#done

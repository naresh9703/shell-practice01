
#!/bin/bash

disk_usage=$(df -hT | grep -v Filesystem)
disk_threshold=1 


while IFS= read line
do
    USAGE=$(echo $line | awk '{print $6F}'| cut -d "%" -f1)
    partition=$(echo $line | awk '{print $7F}')
    if [ $USAGE -ge $disk_threshold ]
    then
    MSG+="High Disk Usage on $partition: $USAGE \n"
    fi
done <<< $disk_usage

echo -e $MSG
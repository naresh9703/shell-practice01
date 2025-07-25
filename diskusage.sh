
#!/bin/bash

disk_usage=$(df -hT | grep -v Filesystem)
disk_threshold=1 


while IFS= read line
do
    USAGE=$(echo $line | awk '{print $6F}'| cut -d "%" -f1)
    partition=$(echo $line | awk '{print $7F}')
    echo "$partition: $USAGE"
done <<< $disk_usage
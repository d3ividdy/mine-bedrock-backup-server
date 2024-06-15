#!/bin/bash
export FILE_TO_BK="$(date +'%Y%m%dT%H%M%SZ').tar.gz"
export TIMER_STOP=$TIME_SEC_FOR_STOP_SERVER
export MINE_BEDROCK=$MINE_BEDROCK_SERVER_NAME

echo "[Backup] Say in server"
for (( ; TIMER_STOP>=0; TIMER_STOP-- ))
do
    docker exec $MINE_BEDROCK send-command say Server Turned OFF in $TIMER_STOP seconds
    sleep 1
done

echo "[Backup] Stop server"
docker stop $MINE_BEDROCK

echo "[Backup] Backuping folder!"
tar -czf $FILE_TO_BK folder # use "tar -xzvf file.tar.gz" to unzip folder
mv $FILE_TO_BK backups
echo "[Backup] Done!"

echo "[Backup] Start Server"
docker start $MINE_BEDROCK
# Docker & Bash to backup server

only Minecraft Bedrock

## Steps to run

Add in /etc/crontab for backup save my_world at 06:00hr all days

```ini
# grep CRON /var/log/syslog
00 06	* * *   root    docker run --rm -v /etc/localtime:/etc/localtime:ro -v /var/run/docker.sock:/var/run/docker.sock -v /path/local/server/worlds/my_world:/data/folder -v /path/local/server/backups:/data/backups -e TIME_SEC_FOR_STOP_SERVER=20 -e MINE_BEDROCK_SERVER_NAME="mine.bedrock" d3ividdy/mine-bedrock-backup-server:1.0.1
```

## Envs

TIME_SEC_FOR_STOP_SERVER: Timer in Seconds to Stop server
MINE_BEDROCK_SERVER_NAME: Container Name Server (or ID)

## Notes

Create/Update image docker

```sh
docker build -f Dockerfile -t d3ividdy/mine-bedrock-backup-server:<tag_version> . --no-cache
docker push d3ividdy/mine-bedrock-backup-server:<tag_version>
```
FROM docker

RUN apk add --no-cache bash

WORKDIR /data

ADD backup.sh backup.sh
CMD ["bash", "backup.sh"]
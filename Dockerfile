FROM ubuntu:xenial

RUN apt-get update \
&& apt-get install -y etcd \
# Delete all the apt list files since they're big and get stale quickly
&& rm -rf /var/lib/apt/lists/*

EXPOSE 2379 2380

CMD [ "/usr/bin/etcd" ]

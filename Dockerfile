FROM ubuntu:xenial

ARG ETCD_VER=v2.3.8
ARG DOWNLOAD_URL=https://github.com/coreos/etcd/releases/download

RUN curl -L ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz -o /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz \
&& mkdir -p /tmp/test-etcd && tar xzvf /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz -C /tmp/test-etcd --strip-components=1 \
&& mv /tmp/test-etcd/etcd /usr/bin/etcd \
&& mv /tmp/test-etcd/etcdctl /usr/bin/etcdctl \
&& rm -rf /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz \
&& rm -rf /tmp/test-etcd

EXPOSE 2379 2380

CMD [ "/usr/bin/etcd" ]

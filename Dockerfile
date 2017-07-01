FROM alpine:3.6

#
# BASE PACKAGES + Node.js and Yarn
#
RUN apk add --no-cache \
            bash \
            git \
            curl \
            jq \
            zip \
            ca-certificates \
            nodejs-current \
            yarn

#
# INSTALL AND CONFIGURE
#
COPY docker-entrypoint.sh /opt/docker-entrypoint.sh
RUN chmod u+rx,g+rx,o+rx,a-w /opt/docker-entrypoint.sh && \
    addgroup -g 10777 worker && \
    adduser -D -G worker -u 10777 worker && \
    mkdir /work/ && \
    mkdir /work-private/ && \
    mkdir /work-bin/ && \
    mkdir /data/ && \
    chown -R worker:worker /work/ && \
    chmod -R u+rwx,g+rwx,o-rwx /work/ && \
    chown -R worker:worker /work-private/ && \
    chown -R worker:worker /work-bin/ && \
    chown -R worker:worker /data/ && \
    chmod -R u+rwx,g+rwx,o-rwx /work-private/ && \
    rm -rf /tmp/* /var/cache/apk/*

#
# RUN
#
EXPOSE 2990
USER worker
WORKDIR /work/
VOLUME ["/work"]
VOLUME ["/work-private"]
VOLUME ["/work-bin"]
VOLUME ["/data"]
ENTRYPOINT ["/opt/docker-entrypoint.sh"]
CMD ["npm", "-version"]

FROM alpine:3.5

#
# BASE PACKAGES + DOWNLOAD GLIBC & ORACLE JAVA & ATLASSIAN SDK
#
RUN apk add --no-cache \
            bash \
            nodejs-current

#
# INSTALL AND CONFIGURE
#
COPY docker-entrypoint.sh /opt/docker-entrypoint.sh
RUN chmod u+rx,g+rx,o+rx,a-w /opt/docker-entrypoint.sh && \
    addgroup -g 10777 worker && \
    adduser -D -G worker -u 10777 worker && \
    mkdir /work/ && \
    chown -R worker:worker /work/ && \
    chmod -R u+rwx,g+rwx,o-rwx /work/ && \
    rm -rf /tmp/* /var/cache/apk/*

#
# RUN
#
EXPOSE 2990
USER worker
WORKDIR /work/
VOLUME ["/work"]
ENTRYPOINT ["/opt/docker-entrypoint.sh"]
CMD ["npm", "-version"]
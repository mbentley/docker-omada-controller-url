# rebased/repackaged base image that only updates existing packages
FROM mbentley/alpine:latest
LABEL maintainer="Matt Bentley <mbentley@mbentley.net>"

# add webhook
RUN apk --no-cache add webhook

# add user
RUN addgroup -g 517 webhook &&\
  adduser -h /home/webhook -D -u 517 -g webhook -G webhook -s /sbin/nologin webhook

# add webhook config file & script w/urls to return
COPY webhook.json /etc/webhook.json
COPY omada_ver_to_url.sh /omada_ver_to_url.sh

USER webhook
ENTRYPOINT ["webhook"]
CMD ["-nopanic","-hooks","/etc/webhook.json","-verbose","-ip","0.0.0.0","-port","9000"]

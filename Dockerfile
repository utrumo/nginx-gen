ARG BASE_ALPINE_IMAGE_TAG=3.12.0
FROM alpine:${BASE_ALPINE_IMAGE_TAG}
# https://github.com/jwilder/docker-gen/releases
ARG DOCKER_GEN_VERSION=0.7.4
RUN set -x \
    && apkArch="$(cat /etc/apk/arch)" \
    && case "$apkArch" in \
        x86_64) \
            BUILD=alpine-linux-amd64 \
            ;; \
        armv7) \
            BUILD=alpine-linux-armhf \
            ;; \
    esac \
    && wget https://github.com/jwilder/docker-gen/releases/download/${DOCKER_GEN_VERSION}/docker-gen-${BUILD}-${DOCKER_GEN_VERSION}.tar.gz -O- \
    | tar xvz -C /usr/local/bin/
WORKDIR /etc/docker-gen/templates
ADD https://raw.githubusercontent.com/jwilder/nginx-proxy/master/nginx.tmpl .
RUN sed -i 's|/etc/nginx/dhparam/dhparam.pem|/etc/nginx/certs/dhparam.pem|' nginx.tmpl
ENTRYPOINT ["docker-gen"]
CMD ["-notify-sighup", "nginx-proxy", "-watch", "-wait", "5s:30s", "./nginx.tmpl", "/etc/nginx/conf.d/default.conf"]

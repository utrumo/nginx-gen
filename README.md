# nginx-gen
Dockerfile for multiarch [nginx-gen](https://hub.docker.com/r/utrumo/nginx-gen) image with [alpine](https://github.com/alpinelinux/docker-alpine), [docker-gen](https://github.com/jwilder/docker-gen) and template from [nginx-proxy](https://github.com/nginx-proxy/nginx-proxy).

- Works with x86_64 and armv7 processor architecture.
- Correctly finds and uses default dhparam.pem which generates docker-letsencrypt-nginx-proxy-companion.

## Example of use:
[docker-compose.yml](https://github.com/utrumo/docker-nginx-proxy-with-letsencrypt) with [nginx](https://hub.docker.com/_/nginx), [nginx-gen](https://hub.docker.com/r/utrumo/nginx-gen) and [docker-letsencrypt-nginx-proxy-companion](https://hub.docker.com/r/jrcs/letsencrypt-nginx-proxy-companion)

# docker-nodejs

[![](https://codeclou.github.io/doc/badges/generated/docker-image-size-46.svg)](https://hub.docker.com/r/codeclou/docker-nodejs/tags/) [![](https://codeclou.github.io/doc/badges/generated/docker-from-alpine-3.5.svg)](https://alpinelinux.org/) [![](https://codeclou.github.io/doc/badges/generated/docker-run-as-non-root.svg)](https://docs.docker.com/engine/reference/builder/#/user)

Docker-Image to run [NodeJS](https://nodejs.org/en/) for dockerized builds.

-----

&nbsp;

### Prerequisites

 * Runs as non-root with fixed UID 10777 and GID 10777. See [howto prepare volume permissions](https://github.com/codeclou/doc/blob/master/docker/README.md).
 * See [howto use SystemD for named Docker-Containers and system startup](https://github.com/codeclou/doc/blob/master/docker/README.md).

-----

&nbsp;

### Usage

Assuming you are currently inside a NodeJS Project containing a `package.json`, you can do an `npm install` like this:

```
docker run \
    -i -t \
    -v $(pwd):/work \
    codeclou/docker-nodejs:7.5.0 \
    npm install
```

-----
&nbsp;

### License

[MIT](https://github.com/codeclou/docker-nodejs/blob/master/LICENSE) © [Bernhard Grünewaldt](https://github.com/clouless)

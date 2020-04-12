FROM alpine:3.11

EXPOSE 80

CMD ["thumbor", "-l", "info", "-p", "80", "-c", "/etc/thumbor.conf"]

ENV THUMBOR_VERSION 6.7.5

RUN apk add --no-cache \
		python \
    libcurl \
		ca-certificates \
		libjpeg-turbo \
    openjpeg \
    libwebp \
    tiff \
    gcc \
		py-pip \
		curl-dev \
		python-dev \
		musl-dev \
		libjpeg-turbo-dev \
    openjpeg-dev \
    libwebp-dev \
    tiff-dev \
    libressl-dev \
	&& export LIBRARY_PATH=/lib \
	&& pip install thumbor==$THUMBOR_VERSION \
	&& apk del gcc *-dev \
	&& rm -rf /var/cache/apk/* \
	&& rm -rf /root/.cache

COPY thumbor.conf /etc/thumbor.conf

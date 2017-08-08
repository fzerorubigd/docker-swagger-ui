FROM nginx:1-alpine

ENV SWAGGER_UI_VERSION 3.1.4 
ENV URL **None**

RUN apk update \
    && apk add curl tar \
    && curl -L https://github.com/swagger-api/swagger-ui/archive/v${SWAGGER_UI_VERSION}.tar.gz | tar -zxv -C /tmp \
    && cp -R /tmp/swagger-ui-${SWAGGER_UI_VERSION}/dist/* /usr/share/nginx/html \
    && apk del curl tar \
    && rm -rf /tmp/*

COPY run.sh /run.sh

CMD ["/run.sh"]

FROM alpine:3.7
LABEL maintainer="sandalblack19@gmail.com"
RUN apk add -U nodejs && npm i -g npm@^5.7 && \
    echo Node version: && node -v && \
    echo NPM version: && npm -v && \
    addgroup -S web && \
    adduser -S web -G web
COPY . /home/web/src
RUN chown web:web /home/web -R
USER web
WORKDIR /home/web/src
RUN npm ci
EXPOSE 8080
ENTRYPOINT ["npm", "run", "start"]

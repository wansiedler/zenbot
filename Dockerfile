FROM node:10 as builder
ADD . /app
WORKDIR /app
RUN npm install -g node-gyp
RUN npm install --unsafe

FROM node:10-alpine

COPY zenbot.sh /usr/local/bin/zenbot

WORKDIR /app
RUN chown -R node:node /app

COPY --chown=node . /app
COPY --chown=node --from=builder /usr/local/lib/node_modules/ /usr/local/lib/node_modules/
COPY --chown=node --from=builder /app/node_modules /app/node_modules/
COPY --chown=node --from=builder /app/dist /app/dist/

USER node
ENV NODE_ENV production
ENV ZENBOT_MONGODB_HOST mongodb.zenbot.svc.cluster.local
ENV ZENBOT_MONGO_USERNAME admin
ENV ZENBOT_MONGO_PASSWORD 3hwF0MCeEZ

ENTRYPOINT ["/usr/local/bin/zenbot"]
CMD ["trade","--paper"]

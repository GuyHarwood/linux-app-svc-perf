FROM node:8

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app
RUN rm -rf ./node_modules
RUN yarn install --production --ignore-engines
RUN yarn global add pm2

# Show current folder structure in logs
RUN ls -al

EXPOSE 3003
CMD ["pm2-docker", "start", "--auto-exit", "--env", "production", "pm2.json" ]

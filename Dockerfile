# only dev image. not used in other stages
FROM node:18.6-slim AS dev_image
RUN npm i -g @nestjs/cli
RUN echo "alias ll='ls -lah'" >> /home/node/.bashrc
RUN apt-get update && apt-get install -y procps
USER node
WORKDIR /app

# from here on will be steps of production build.
FROM node:18.6-slim AS pre_image
RUN mkdir /app && chown -R node:node /app
USER node
WORKDIR /app

FROM pre_image AS modules_image
ADD --chown=node:node source/package*.json /app/
RUN yarn

FROM modules_image AS tests_image
ADD --chown=node:node source /app
RUN yarn test

FROM tests_image AS dist_image
RUN yarn build

# this image is used for production
FROM modules_image AS production_image
COPY --from=dist_image /app/dist /app/dist
CMD ["yarn", "start:prod"]
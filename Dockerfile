FROM node:12
RUN apt-get update 
RUN apt-get install -y git imagemagick 
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /ecs-app

COPY package*.json ./
COPY . .

RUN npm install
RUN chown -R node:node /ecs-app

ENV NODE_ENV=production
ENV ENV_ECS=true
USER root
EXPOSE 80

ENTRYPOINT ["npm", "start"]

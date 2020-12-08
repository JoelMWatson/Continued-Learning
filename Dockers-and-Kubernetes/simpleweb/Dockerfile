# specify base image
FROM node:alpine

# place your application
WORKDIR /usr/app

# copy package.json
COPY ./package.json ./

# install dependencies
RUN npm install

# copy local files to container ("COPY <src> <dest>")
COPY ./ ./

# default command
CMD ["npm", "start"]
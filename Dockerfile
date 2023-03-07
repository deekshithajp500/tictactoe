# use the latest node LTS release
FROM node:gallium \
  && ubuntu:20.04
  
WORKDIR /usr/src/app

# copy package.json and package-lock.json and install packages. we do this
# separate from the application code to better use docker's caching
# `npm install` will be cached on future builds if only the app code changed
COPY package*.json ./
RUN npm install \
 && apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-setuptools

# copy the app
COPY . .

RUN pip3 install -r python_requirements.txt \
 && pip3 install .

# expose port 3000 and start the app
EXPOSE 3000
CMD [ "npm", "start" ]


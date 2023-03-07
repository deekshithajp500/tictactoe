# use the latest node LTS release
FROM node:gallium \
  && ubuntu:20.04 \
  && python:3.8-slim-buster
  
WORKDIR /usr/src/app

# copy package.json and package-lock.json and install packages. we do this
# separate from the application code to better use docker's caching
# `npm install` will be cached on future builds if only the app code changed
COPY package*.json ./
RUN npm install \
 && pip3 install -r python_requirements.txt \
 && pip3 install .


# copy the app
COPY . .

# expose port 3000 and start the app
EXPOSE 3000
CMD [ "npm", "start" ]
CMD ["python3" , "tictactoe.py"]

# Installs the current application on a Node Image.
FROM node:8.11
# The qq is for silent output in the console
# You are welcome to modify this part as it
RUN apt-get update && apt-get install -y build-essential libpq-dev vim
# Sets the path where the app is going to be installed
ENV APP_ROOT /usr/app/
# Creates the directory and all the parents (if they don’t exist)
RUN mkdir -p $APP_ROOT
# Sets the /usr/app as the active directory
WORKDIR $APP_ROOT
# Copies all the content
COPY . .
# Install all the packages
# RUN npm install -g @vue/cli
# RUN npm install
RUN npm install
# Uncomment this if you went with Option #2 in Step #2 (Windows Only)
# RUN npm rebuild node-sass --force
# The default port from ng serve (4200)
# and 49153 for Webpack Hot Module Reload
# EXPOSE 4200 49153

EXPOSE 8099
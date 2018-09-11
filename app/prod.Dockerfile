# build stage
FROM node:8.11 as build-stage

# Sets the path where the app is going to be installed
ENV APP_ROOT /usr/app/

# Creates the directory and all the parents (if they don’t exist)
RUN mkdir -p $APP_ROOT

# Sets the /usr/app as working directory
WORKDIR $APP_ROOT

# Copies all the content
COPY . .

# Install all independency package
RUN npm install

# Build the project
RUN npm run build

# production stage
FROM nginx:1.13.12-alpine as production-stage

# Copy the build production directory from build-stage into nginx/vuejs_nginx
COPY --from=build-stage /usr/app/dist /usr/share/nginx/vuejs_nginx

# Copy the nginx config file into nginx system
COPY ./vuejs_nginx.conf /etc/nginx/conf.d

# CMD ["nginx", "-g", "daemon off;"]
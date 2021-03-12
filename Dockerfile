FROM node:alpine as build
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build output directory for build
FROM nginx
EXPOSE 80
COPY --from=build /app/build /usr/share/nginx/html
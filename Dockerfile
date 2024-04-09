#stage 1 
FROM node:14-alpine as node
WORKDIR /app
COPY . .
RUN npm install --force
RUN npm run build --prod

#stage 2
FROM nginx:alpine
COPY --from=node /app/dist/crudtuto-Front /usr/share/nginx/html


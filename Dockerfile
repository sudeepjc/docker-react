FROM node:alpine as builder
WORKDIR /home/sdc/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /home/sdc/app/build /usr/share/nginx/html
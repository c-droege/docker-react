#Build Image
FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#/app/build <-- all the builded stuff
#Production Image
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html



FROM node:alpine AS builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY ./ ./
# additional steps because docker run on root linux system
RUN chown -R node /app/node_modules
RUN chown -R node /app/build
USER node
# ------
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

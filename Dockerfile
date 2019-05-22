FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "build"]

FROM nginx
COPY --from=builder app/build /usr/share/nginx/html
# el comando default de nginx es hacer start, entonces no necesitamos hacer nada



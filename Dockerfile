#Multi-stop Docker file
FROM node:16-alpine AS BUILDER
USER node
WORKDIR /app
COPY package.json .
RUN npm install
COPY --chown=node:node . .
CMD ["npm", "run", "build"]


FROM nginx
COPY --from=BUILDER /app/build /usr/share/nginx/html

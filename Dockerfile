# Build sapper app
FROM node:14 AS build-env
WORKDIR /app

COPY package*.json ./
RUN npm ci
COPY ./ ./
RUN npm run build

# Installation of production dependencies
FROM node:14 AS install-env
WORKDIR /app

COPY package*.json ./
RUN npm ci --production

# Final image (distroless image)
FROM gcr.io/distroless/nodejs:14
WORKDIR /app

COPY --from=install-env /app/node_modules/ node_modules/
COPY --from=build-env /app/__sapper__/build __sapper__/build/
COPY static/ static/

CMD ["__sapper__/build/index.js"]

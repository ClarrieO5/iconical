FROM node:18-alpine

ENV NODE_ENV=production
ARG NPM_BUILD="npm install --omit=dev"
EXPOSE 8080/tcp

LABEL maintainer="iconical iconical Team"
LABEL summary="iconical proxy image"
LABEL description="Example application of iconical which can be deployed in production."

WORKDIR /app

COPY ["package.json", "package-lock.json", "./"]
RUN $NPM_BUILD

COPY . .

ENTRYPOINT [ "node" ]
CMD ["src/index.js"]

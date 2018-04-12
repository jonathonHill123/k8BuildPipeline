FROM node:6.9.2
EXPOSE 3000
COPY server.js .
CMD node server.js

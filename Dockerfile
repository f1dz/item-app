# Dockerfile to create image

# Image source
FROM node:14

# Working directory
WORKDIR /app

# Copy source to image
COPY /a433-microservices /app/

# Setup environment for deploy
ENV NODE_ENV=production DB_HOST=item-db

# Install libs and build the app
RUN npm install --production --unsafe-perm && npm run build

# Expose port so can be access from outside
EXPOSE 8080

# Command to start the app. Will be executed when the container is up
CMD ["npm","start"]
# Use official Node.js image
FROM node:14

# Set working directory
WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy app files
COPY . .

# Expose port
EXPOSE 80

# Start app
CMD ["npm", "start"]

# mkdir Node-Js-Application-Deployment 

# cd Node-Js-Application-Deployment 

# Dockerfile

# This command represent the base OS image
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install --only=production

# Copy the rest of the application code
COPY . .

# Expose port 3000 to the outside world
EXPOSE 3000

# Define the command to run the application
CMD ["npm", "start"]



# touch index.js
# This will create a index.js file in the folder
# This basic Node.js application listens on port 3000 and returns a simple message when accessed.

const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

// Define a simple route
app.get('/', (req, res) => {
  res.send('Hello, World! This is a simple Node.js application running in a Docker container.');
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});



# touch package.json
# This will create a package.json file in the folder
# This package.json file includes express as a dependency, which is a popular web framework for Node.js.


{
  "name": "simple-node-app",
  "version": "1.0.0",
  "description": "A simple Node.js application running in a Docker container.",
  "main": "index.js",
  "scripts": {
    "start": "node index.js"
  },
  "dependencies": {
    "express": "^4.18.2"
  },
  "author": "Your Name",
  "license": "ISC"
}


# Build the Docker Image
  docker build -t simple-node-app:latest

# Run a Docker container in the background 
  docker run -d -p 3000:3000 simple-node-app:latest

# Login to Docker Hub
  docker login 

# Push the Docker Image to Docker Hub
  docker push ashbhoyar/simple-node-app:latest# Task-1

# This command represent the base OS image
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install 

# Copy the rest of the application code
COPY . .

# Expose port 3000 to the outside world
EXPOSE 3000

# Define the command to run the application
CMD ["npm", "start"]

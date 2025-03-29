# Use Node.js as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker cache
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire backend code into the container
COPY . .

# Expose the port the backend runs on
EXPOSE 5000

# Start the backend server
CMD ["node", "app.js"]

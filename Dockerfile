# Use Node.js to build the React app
FROM node:18 as builder

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire frontend code into the container
COPY . .

# Build the React app
RUN npm run build

# Use Nginx to serve the built frontend
FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html

# Expose port 80 for serving the frontend
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

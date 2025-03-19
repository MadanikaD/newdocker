# Use Node.js Alpine base image
FROM node:18-alpine  # Specify version for stability

# Create and set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker caching
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci --only=production  # Prefer `npm ci` for better reproducibility

# Copy the entire codebase to the working directory
COPY . .

# Expose the application port
EXPOSE 3000

# Define the command to start your application
CMD ["npm", "start"]

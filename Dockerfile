# Use an official Node.js runtime as the base image
FROM node:18.18.0

# Set the working directory in the container
WORKDIR /app

# Copy only the package.json and yarn.lock files into the container
COPY package.json yarn.lock ./

# Install application dependencies using yarn (in a separate layer)
RUN yarn install --frozen-lockfile

# Copy the rest of the application code into the container
COPY . .

# Expose port 3000 for the application
EXPOSE 3000

# Command to start the application when the container is started
CMD ["yarn", "start"]


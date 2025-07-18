FROM node:18-alpine

WORKDIR /app

# Copy package file
COPY package.json ./

# Install ALL dependencies (including dev dependencies for build)
RUN npm install

# Copy app files
COPY . .

# Build the app (skip linting to avoid ESLint errors in generated code)
RUN npm run build -- --no-lint

# Expose port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
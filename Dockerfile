# Stage 1: Build the Vue.js app with Node.js 22
FROM node:22-alpine AS build-stage

# Set working directory
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm ci

# Copy the source code
COPY . .

# Build the Vue app for production
RUN npm run build

# Stage 2: Serve the built app using Nginx
FROM nginx:stable-alpine AS production-stage

# Copy built assets from the build stage
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Optional: Add custom nginx config if using Vue Router history mode
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]

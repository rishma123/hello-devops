# Step 1: Use a lightweight Node image
FROM node:18-alpine

# Step 2: Set working directory
WORKDIR /app

# Step 3: Copy code and install dependencies
COPY package*.json ./
RUN npm install

# Step 4: Copy rest of the app
COPY . .

# Step 5: Build the app
RUN npm run build

# Step 6: Serve the build
RUN npm install -g serve
CMD ["serve", "-s", "build"]

# Expose port 3000
EXPOSE 3000

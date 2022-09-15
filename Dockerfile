# Most of the time, Alpine is a great base image to start with.
# If we're building a container for Python, we use something different.
# Learn why here: https://pythonspeed.com/articles/base-image-python-docker-images/
# TLDR: Alpine is very slow when it comes to running Python!

# STEP 1: Install base image. Optimized for Python.
FROM node:16

# STEP 2: Copy the source code in the current directory to the container
# Store it in a folder named /app.
ADD . /app

# STEP 3: Set working directory to /app so we can execute commands in it
WORKDIR /app

# STEP 4: Install required dependencies
COPY package.json /app

# STEP 5: Declare environment variables
RUN npm install

# STEP 6: Expose the port that Flask is running on
EXPOSE 3000

# STEP 7: Run Flask!
CMD ["node", "index.js"]
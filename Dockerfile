#Use official Node.js runtime as the base image
FROM node:23-alpine

#Set the working directory in the container
WORKDIR /usr/src/app

#copy package.json and package-lock.json on the working directory
COPY package*.json ./

#install dependancies
RUN npm install

#Copy the rest of de application code to the working directory
COPY . .

#Expose the port on with your node.js app run
EXPOSE 3000

#command to run your node.js application
CMD ["npm","start"]
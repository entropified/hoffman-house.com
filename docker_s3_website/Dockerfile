#build environment
FROM node:8
ARG SC_ENV
ARG SC_AWS_REGION
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG AWS_DEFAULT_REGION

RUN mkdir /usr/src/static
ENV PATH /usr/src/static/node_modules/.bin:$PATH
COPY src /usr/src/static
WORKDIR /usr/src/static
RUN npm i npm@latest -g
# For now we don't need the s3-website package, we'll just copy with aws cli
#RUN npm install s3-website
#RUN npm run build
#incase we locally deploy
RUN npm install -g http-server
#Allows us to push our builds from running the container through the deploy.sh file
RUN chmod 755 /usr/src/static/deploy.sh /usr/src/static/wait_for_deploy.sh
RUN apt-get -y update && apt-get install -y awscli
RUN aws configure set default.s3.signature_version s3v4

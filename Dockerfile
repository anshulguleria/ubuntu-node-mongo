# Custom image for latest ubuntu having node, git
# and mongodb inbuilt to the image.
FROM ubuntu:latest
MAINTAINER Anshul Guleria <anshulguleria@ymail.com>

# Install mongo
RUN \
        apt-get update > /dev/null && \
        apt-get install -y curl && \
        curl -O https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-3.0.12.tgz && \
        tar -zxvf mongodb-linux-x86_64-3.0.12.tgz && \
        mv mongodb-linux-x86_64-3.0.12 mongodb && \
        rm -rf mongodb-linux-x86_64-3.0.12.tgz && \
        mkdir -p /data/db

# Install git. Git is installed
# because it is required for npm modules
RUN \
        apt-get update > /dev/null && \
        apt-get install -y git


# Install nodejs 6.x
RUN \
        apt-get update > dev/null && \
        curl -sL https://deb.nodesource.com/setup_6.x | bash && \
        apt-get install -y nodejs

# Set environment path for mongodb
ENV PATH=/mongodb/bin:$PATH

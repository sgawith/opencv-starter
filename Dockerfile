# opencv-starter Docker image.
# Based on the node-opencv image defined by Peter Braden (https://github.com/peterbraden/node-opencv)

# Ubuntu 14.04 (Trusty) to match target environment
FROM	ubuntu:14.04

# Add multiverse to the sources list - may be needed for some packages
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise multiverse\n\
deb-src http://us.archive.ubuntu.com/ubuntu/ precise multiverse\n\
deb http://us.archive.ubuntu.com/ubuntu/ precise-updates multiverse\n\
deb-src http://us.archive.ubuntu.com/ubuntu/ precise-updates multiverse\n"\
>> /etc/apt/sources.list

RUN rm -vf /var/lib/apt/lists/*
RUN DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq
RUN apt-get install -y unoconv
RUN apt-get clean

RUN apt-get update -qq
RUN apt-get install -y curl
RUN apt-get clean

RUN apt-get update -qq
RUN apt-get install -y imagemagick
RUN apt-get clean

RUN apt-get update -qq
RUN apt-get install -y libopencv-core2.4
RUN apt-get clean

RUN apt-get update -qq
RUN apt-get install -y libopencv-dev
RUN apt-get clean

RUN apt-get update -qq
RUN apt-get install -y v4l-utils
RUN apt-get clean

RUN apt-get update -qq
RUN apt-get install -y x264
RUN apt-get clean

RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN apt-get clean

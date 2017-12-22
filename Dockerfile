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
RUN apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y software-properties-common
# RUN apt-get install -y curl
# RUN apt-get install -y cmake
# RUN apt-get install -y wget
# RUN apt-get install -y unzip
RUN apt-get install -y libopencv-dev
# RUN apt-get install -y build-essential
# RUN apt-get install -y git
# RUN apt-get install -y libgtk2.0-dev
# RUN apt-get install -y pkg-config
# RUN apt-get install -y python-dev
# RUN apt-get install -y python-numpy
# RUN apt-get install -y libdc1394-22
# RUN apt-get install -y libdc1394-22-dev
# RUN apt-get install -y libjpeg-dev
# RUN apt-get install -y libpng12-dev
# RUN apt-get install -y libtiff4-dev
# RUN apt-get install -y libjasper-dev
# RUN apt-get install -y libavcodec-dev
# RUN apt-get install -y libavformat-dev
# RUN apt-get install -y libswscale-dev
# RUN apt-get install -y libxine-dev
# RUN apt-get install -y libgstreamer0.10-dev
# RUN apt-get install -y libgstreamer-plugins-base0.10-dev
# RUN apt-get install -y libv4l-dev
# RUN apt-get install -y libtbb-dev
# RUN apt-get install -y libqt4-dev
# RUN apt-get install -y libfaac-dev
# RUN apt-get install -y libmp3lame-dev
# RUN apt-get install -y libopencore-amrnb-dev
# RUN apt-get install -y libopencore-amrwb-dev
# RUN apt-get install -y libtheora-dev
# RUN apt-get install -y libvorbis-dev
# RUN apt-get install -y libxvidcore-dev
RUN apt-get install -y x264
RUN apt-get install -y v4l-utils
RUN apt-get install -y imagemagick
RUN apt-get install -y libopencv-core2.4
RUN apt-get install -y unoconv
RUN apt-get clean
RUN apt-get update -qq

# RUN mkdir opencv
# WORKDIR opencv

# RUN wget https://github.com/opencv/opencv/archive/3.3.1.zip -O opencv-3.3.1.zip
# RUN unzip opencv-3.3.1.zip
# RUN mkdir opencv-3.3.1/build
# WORKDIR opencv-3.3.1/build

# RUN cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D WITH_OPENGL=ON ..

# RUN make -j $(nproc) && make install
# RUN echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf
# RUN ldconfig

RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
RUN apt-get install -y nodejs
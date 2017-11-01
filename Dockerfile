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

RUN apt-get update -qq
RUN apt-get install -y \
software-properties-common \
curl \
cmake \
wget \
unzip \
libopencv-dev \
build-essential \
git \
libgtk2.0-dev \
pkg-config \
python-dev \
python-numpy \
libdc1394-22 \
libdc1394-22-dev \
libjpeg-dev \
libpng12-dev \
libtiff4-dev \
libjasper-dev \
libavcodec-dev \
libavformat-dev \
libswscale-dev \
libxine-dev \
libgstreamer0.10-dev \
libgstreamer-plugins-base0.10-dev \
libv4l-dev \
libtbb-dev \
libqt4-dev \
libfaac-dev \
libmp3lame-dev \
libopencore-amrnb-dev \
libopencore-amrwb-dev \
libtheora-dev \
libvorbis-dev \
libxvidcore-dev \
x264 \
v4l-utils \
imagemagick

RUN mkdir opencv
WORKDIR opencv

RUN wget https://github.com/opencv/opencv/archive/2.4.13.4.zip -O opencv-2.4.13.4.zip
RUN unzip opencv-2.4.13.4.zip
RUN mkdir opencv-2.4.13.4/build
WORKDIR opencv-2.4.13.4/build

RUN cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D WITH_OPENGL=ON ..

RUN make -j $(nproc) && make install
RUN echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf
RUN ldconfig

RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
RUN apt-get install -y nodejs
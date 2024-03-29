FROM ubuntu:16.04

# Install system packages
RUN apt-get -qq update && apt-get -qq install --no-install-recommends -y python3 \ 
 python3-dev \
 python-pil \
 python-lxml \
 python-tk \
 build-essential \
 cmake \ 
 git \ 
 libgtk2.0-dev \ 
 pkg-config \ 
 libavcodec-dev \ 
 libavformat-dev \ 
 libswscale-dev \ 
 libtbb2 \
 libtbb-dev \ 
 libjpeg-dev \
 libpng-dev \
 libtiff-dev \
 libjasper-dev \
 libdc1394-22-dev \
 x11-apps \
 wget \
 vim \
 ffmpeg \
 unzip \
 && rm -rf /var/lib/apt/lists/* 

# Install core packages 
RUN wget -q -O /tmp/get-pip.py --no-check-certificate https://bootstrap.pypa.io/get-pip.py && python3 /tmp/get-pip.py
RUN  pip install -U pip \
 numpy \
 imutils

# Download & build OpenCV
RUN wget -q -P /usr/local/src/ --no-check-certificate https://github.com/opencv/opencv/archive/3.4.1.zip
RUN cd /usr/local/src/ \
 && unzip 3.4.1.zip \
 && rm 3.4.1.zip \
 && cd /usr/local/src/opencv-3.4.1/ \
 && mkdir build \
 && cd /usr/local/src/opencv-3.4.1/build \ 
 && cmake -D CMAKE_INSTALL_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local/ .. \
 && make -j4 \
 && make install \
 && rm -rf /usr/local/src/opencv-3.4.1

# Setting up working directory 
RUN mkdir /lab
WORKDIR /lab
#ADD . /lab/

RUN pip install -U imutils

# Minimize image size 
RUN (apt-get autoremove -y; \
     apt-get autoclean -y)

CMD bash exec.sh

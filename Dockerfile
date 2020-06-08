FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

RUN apt-get clean && apt-get update && apt-get install -y \
      build-essential \
      git \
      libgtk2.0-dev \ 
      pkg-config \
      libavcodec-dev \ 
      libswscale-dev \
      libatlas-base-dev \
      libatlas-dev \
      libboost-all-dev \
      libgflags-dev \
      libgoogle-glog-dev \
      libhdf5-dev \
      libleveldb-dev \
      liblmdb-dev \
      libprotobuf-dev \
      libsnappy-dev \
      lsb-release \
      protobuf-compiler \
      zip \
      wget \
      python-pip \
      python-dev \
      ffmpeg \
      cmake \
      libopencv-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install opencv-python numpy==1.11 scipy==0.17

RUN git clone https://github.com/llfl/DORN && cd DORN

RUN mkdir caffe_build && cd caffe_build && cmake ../caffe && make -j"$(nproc)"
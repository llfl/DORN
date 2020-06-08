FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu16.04

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

RUN pip install future opencv-python numpy==1.12 scipy==0.17 PyWavelets==0.5.2 Pillow==6.2.2 networkx==2.2 dask==1.2.2 cloudpickle==0.8.1 matplotlib==2.1.2 protobuf scikit-image==0.14 

RUN git clone https://github.com/llfl/DORN && cd DORN

RUN mkdir caffe_build && cd caffe_build && cmake /DORN/caffe && make -j"$(nproc)" && make install 

ENV PYTHONPATH="/DORN/caffe/python:/DORN/caffe/pylayer:${PYTHONPATH}"

CMD [ "/bin/bash" ]
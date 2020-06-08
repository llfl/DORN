FROM nvidia/cuda:9.0-cudnn7-runtime-ubuntu16.04

RUN apt clean && apt update && apt -y upgrade &&\
    apt install -y \
        python \
        python-pip \
        git \
        vim \
        build-essential \
        pkg-config \
        cmake \
    && rm -rf /var/lib/apt/lists/*

RUN pip install opencv-python numpy==1.11 scipy==0.17

RUN git clone https://github.com/llfl/DORN && cd DORN
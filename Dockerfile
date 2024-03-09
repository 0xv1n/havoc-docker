# Use the official Ubuntu 22.04 base image
FROM ubuntu:latest

# Set the working directory
WORKDIR /5pider

# Update the package lists and install necessary packages
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-get update && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y \
    build-essential \
    curl \
    wget \
    sudo \
    python3.10 \
    python3.10-dev \
    git \
    build-essential \
    apt-utils \
    cmake \
    libfontconfig1 \
    libglu1-mesa-dev \
    libgtest-dev \
    libspdlog-dev \
    libboost-all-dev \
    libncurses5-dev \
    libgdbm-dev \
    libssl-dev \
    libreadline-dev \
    libffi-dev \
    libsqlite3-dev \
    libbz2-dev \
    mesa-common-dev \
    qtbase5-dev \
    qtchooser \
    qt5-qmake \
    qtbase5-dev-tools \
    libqt5websockets5 \
    libqt5websockets5-dev \
    qtdeclarative5-dev \
    golang-go \
    qtbase5-dev \
    libqt5websockets5-dev \
    libboost-all-dev \
    mingw-w64 \
    nasm && \
    git clone https://github.com/HavocFramework/Havoc.git && \
    cd Havoc/teamserver && \
    go mod download golang.org/x/sys && \
    go mod download github.com/ugorji/go && \
    cd .. && \
    make ts-build

# Add your application files (if any)
# COPY . /5pider

# Specify the default command to run on container start
CMD ["/bin/bash"]

---
title: How Can I Compile Jazz?
summary: Starting with Jazz by compiling everything from source
sidebar: mydoc_sidebar
permalink: using_compile.html
---

## Before you start

<span class="label label-info">Prerequisites</span>

{% include tip.html content="We try to make Jazz as self-contained and version independent as possible. Any version that is recent enough
to support C++17. The list of prerequisites may not be complete. Please, help us completing it if you find missing tools or version
conflicts." %}

Make sure you are running a Linux box including (see the why column to decide if you need it):

| What | Why |
|------|-----|
| Dev tools (**bash**, **git**, **make**, **gcc**) | To run scripts, clone and build the server. |
| **Libmicrohttpd** (devel) | To build the server. |
| **Curl** (devel) | To build the server. |
| **ZeroMQ** (devel) | To build the server. |
| **ONNX-runtime** (devel) | To build the server. |
| **ONNX** and **Protocol buffers** | To build the server. See `server/src/onnx_proto` inside Jazz. |
| **Doxygen** | To make the server documentation. |
| **scan-build** (included with clang) | To statically analyze the server's source code. |
| **cppcheck** | To statically analyze the server's source code. |
| **Valgrind** | To dynamically analyze the server. |
| **Docker** | To build and run images. |

## Clone the Jazz github repository

     git clone https://github.com/kaalam/Jazz.git

Use the branch master unless you know what you are doing.

## Configure

    cd Jazz
    ./config.sh

You should get (after typing y at the prompt) a screen like the following:

    (usage: ./config.sh [--debug] [--help])

    Gathering information ...

    You will now override:

      - server/src/include/jazz_platform.h (Version and platform const)
      - server/src/uplifted/uplifted_instances.h (Class types of uplifted classes)
      - server/src/uplifted/uplifted_instances.cpp (Class types of uplifted classes)
      - server/Makefile (for C++)
      - server/src/main.dox (main page for Doxygen)
      - docker/base/build_upload.sh (build & upload base Docker image)
      - docker/lss/build_upload.sh (build & upload LSS (Latest Stable Server) Docker image)
      - docker/tng/build_upload.sh (build & upload TNG (The Tangle) Docker image)

    Do you want to continue? [y/N] y


    Writing: server/src/include/jazz_platform.h ... Ok.
    Writing: server/Makefile ... Ok.
    Writing: server/src/main.dox ... Ok.
    Writing: docker/base/build_upload.sh ... Ok.
    Writing: docker/lss/build_upload.sh ... Ok.
    Writing: docker/tng/build_upload.sh ... Ok.
    Creating folder: server/src/uplifted ... Ok.
    Writing: server/src/uplifted/uplifted_instances.h ... Ok.
    Writing: server/src/uplifted/uplifted_instances.cpp ... Ok.

      Congratulations, you have successfully configured your project. Now,
    you should be able to build and install the server.

      - cd server
      - make           // Shows help when invoked without arguments
      - make jazz      // Compiles the server in RELEASE mode
      - make install   // Requires sudo and installs as a Linux service
      - cd docker      // This has everything to build the docker images

## Compile the server

    cd server
    make jazz
    make install

{% include tip.html content="You can also type \"**make**\" without parameters to see the options or \"**make info**\" to see configuration
variables." %}

<br/>

{% include links.html %}

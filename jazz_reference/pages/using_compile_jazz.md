---
title: How can I compile Jazz and the clients?
summary: Starting with Jazz (most advanced option) compiling everything form source.
sidebar: mydoc_sidebar
permalink: using_compile_jazz.html
---

## Before you start

<span class="label label-info">Prerequisites</span>

{% include tip.html content="We try to make Jazz as self-contained and version independent as possible. Any version that is recent enough
to support C++11, R 3.x should be fine. The list of prerequisites may not be complete. Please, help us completing it
if you find missing tools or version conflicts." %}

Make sure you are running a Linux box including (see the why column to decide if you need it):

| What | Why |
|------|-----|
| Dev tools (**bash**, **git**, **make**, **gcc**) | To run scripts, clone and build the server. |
| **Libmicrohttpd** (devel) | To build the server. |
| **Curl** (devel) | To build the server. |
| **Doxygen** | To make the server documentation. |
| **scan-build** (included with clang) | To statically analyze the server's source code. |
| **cppcheck** | To statically analyze the server's source code. |
| **Valgrind** | To dynamically analyze the server. |
| **Docker** | To build and run images. |
| **R** | To build the R package. |
| R package **rcurl** | A dependency of rjazz. |
| R package **knitr** | To make all the package documentations. |
| R package **pkgdown** | To build the R package's documentation website. |

## Clone the Jazz github repository

     git clone https://github.com/kaalam/Jazz.git

Use the branch master unless you know what you are doing.

## Configure

    cd Jazz
    ./config.sh

You should get (after typing y at the prompt) a screen like the following:

    (usage: ./config.sh --help)

    Gathering information ...

    You will now override:

      - server/src/include/jazz_platform.h (Version and platform const)
      - server/Makefile (for C++)
      - server/src/main.dox (main page for Doxygen)
      - r_package/rjazz/DESCRIPTION (With version information for R)
      - r_package/build.sh (to build, test and install the R package)
      - docker/upload_docker.sh (build & upload reference Docker image)

    Do you want to continue? [y/N] y

    Writing: server/src/include/jazz_platform.h ... Ok.
    Writing: server/Makefile ... Ok.
    Writing: server/src/main.dox ... Ok.
    Writing: r_package/rjazz/DESCRIPTION ... Ok.
    Writing: r_package/build.sh ... Ok.
    Writing: docker/upload_docker.sh ... Ok.

      Congratulations, you have successfully configured your project. Now,
    you should be able to:

      1. Build the server

      - cd server
      - make           // Shows help when invoked without arguments
      - make jazz      // Compiles the server in RELEASE mode
      - make install   // Requires sudo and installs as a Linux service

      2. Build the R package

      - cd r_package
      - ./build.sh

## Compile the server

    cd server
    make jazz
    make install

{% include tip.html content="You can also type \"**make**\" without parameters to see the options or \"**make info**\" to see configuration
variables." %}

## Build the R package

    cd r_package
    ./build.sh

{% include tip.html content="You can also type \"**./build_doc.sh**\" to build the documentation website. (Assuming you installed pkgdown.)" %}

{% include tip.html content="Unless you have a correctly configured PyPI account, you will not be able to upload the package you built.)" %}

{% include links.html %}

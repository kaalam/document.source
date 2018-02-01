---
layout: post
title: AI
description: Deep neural networks in the backend
image: assets/images/pic03.jpg
---

Jazz implements an open source, C++14 deep neural networks framework called **[tiny dnn](https://github.com/tiny-dnn/tiny-dnn)**. On top of that,
Jazz provides a bytecode language for describing network architectures, connecting networks to data blocks and instruments and exposing the output
through APIs.

Jazz's bytecode language, named **swing**, gives a consistent way of defining operations across all Jazz modules.
Swing usually hides inside higher level functions available via the "easy API" consistently identical in the R, Python and Typescript clients.

## The dnn layer is tiny-dnn, hence, it has the same features
  - Thread safe
  - Including SSE/AVX simd
  - Can import Caffe models
  - Working on importing TensorFlow models

Below is a list of the built-in deep learning functionalities. You can safely skip that part if you have no interest in neural network's internals.
Besides that "high level" network functionality, Jazz also exposes the "mathematical bricks" to build all basic logical, arithmetic and statistical
operations.


## Supported networks
  - **Layer-types**
    - Core
    - Fully-connected
    - Dropout
    - Linear operation
    - Power
    - Convolution
    - Convolutional
    - Average pooling
    - Max pooling
    - Deconvolutional
    - Average unpooling
    - Max unpooling
    - Normalization
    - Contrast normalization (only forward pass)
    - Batch normalization
    - Split/merge
    - Concat
    - Slice
    - Elementwise-add

  - **Activation functions**
    - Tanh
    - Sigmoid
    - Softmax
    - Rectified linear(relu)
    - Leaky relu
    - Identity
    - Exponential linear units(elu)

  - **Loss functions**
    - Cross-entropy
    - Mean squared error
    - Mean absolute error
    - Mean absolute error with epsilon range

  - **Optimization algorithms**
    - Stochastic gradient descent (with/without L2 normalization)
    - Momentum and Nesterov momentum
    - Adagrad
    - Rmsprop
    - Adam
    - Adamax


*[C++14]: The latest version of C++, an extension of the C computer language appeared in 1983 that is still today the language of use when efficiency is the main concern.
*[deep neural networks framework]: Platforms providing functionality to "learn", "analyze" and "predict" using deep neural networks.
*[bytecode]: A machine-understandable programming code that does basic operations. Unlike machine code, it is not understood by a CPU and has to be executed by some program.
*[data blocks]: The data that is stored inside Jazz is stored in blocks of some internal type.
*[instruments]: An abstraction over the blocks that can handle large data columns without caring about the internal block details or even in which nodes they are stored.
*[APIs]: Application Program Interfaces: The interfaces that allow clients (computers and smartphones) to communicate data with Jazz.
*[easy API]: An API that is identical in all languages and does not require understanding swing.
*[R]: An open source programming language for statistical computing and graphics. The R language is widely used among statisticians and data miners for developing statistical software and data analysis.
*[Python]: A widely used high-level programming language for general-purpose programming that is frequently used for data analysis and machine learning.
*[Typescript]: Typescript is a typed, open source language that is a superset of JavaScript. This means JavaScript is also TS. It is fundamental to technologies like Angular 2 and Ionic 2.
*[deep learning]: Using architectures of functions for data analysis. Typically, these networks are created by "learning" iteratively to do tasks by looking at examples.
*[Thread safe]: All Jazz modules can use as many threads (CPU cores) as are available on each machine.
*[SSE/AVX]: The SIMD technologies implemented in modern processors from Intel and AMD.
*[simd]: Single Instruction on Multiple Data. A technology implemented in modern CPUs to enhance the speed of repetitive mathematical operations by doing many at the same time on the same core.
*[Caffe]: A deep learning framework, originally developed by Yangqing Jia as part of his PhD at UC Berkeley. It is open source and written in C++.
*[TensorFlow]: An open-source software library for machine learning developed by Google.

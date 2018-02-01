---
layout: post
title: What is Jazz?
description: All in one
image: assets/images/pic01.jpg
---

We call Jazz a *"lightweight all-in-one analytical and AI server"*. Let's analyze this phrase a little more in detail.

In the first place Jazz is a server. This means it provides data and computations based on data to clients. The clients connect to it using its
REST API. Clients can be mobile applications or web based applications. Furthermore, you can also view the clients as data since they are just
blocks of code. Extending the idea, Jazz can store its own clients. You can download your Jazz application from the Jazz server. Basically, anything
a user needs is a web browser or a smartphone.

Jazz is analytical. This means it not only stores blocks of data, but *"understands"* most of it. Some blocks, for instance an mp4 video file, do not
make sense to Jazz, but Jazz can still store it and deliver it as a raw block or a mime typed http object. Other blocks, for instance a tensor of
real values representing a color image, **do** make sense and Jazz knows how to make computations with that. Also, as data may be bigger than what
fits on a single node, Jazz has support for sharding. Any node is aware of the whole cluster and can forward computation to the correct place.

Jazz is AI. This means besides the analytical functions one would expect from a data server (filtering, aggregating, etc.) Jazz can also
compute deep neural networks from the data stored in the server. Recently, AI is becoming an industry and major players are developing DNN platforms.
Jazz delivers support to automatically convert Caffe models and TensorFlow support is on its way.

Jazz is all-in-one. You can view Jazz as a new type of data server that hasn't a direct competitor yet. We have combined persistence technology with
deep neural networks and communications. By design, nothing can be faster than a single process. See the section
on [architecture](/jazz/2017/08/05/architecture.html) for more.

Jazz is lightweight. It is entirely written in C++14 and integrates top performing highly reliable open source C and C++ libraries only. A binary
Jazz artifact has a size of around 20 Mb, is installed in less than a minute and has a startup time of less than a second.

Another interesting Jazz feature is, it can provision its own data by connecting to APIs. For instance, a Jazz server providing value over financial
instruments, does not need to have its data updated by a client, it can pull data sources either on demand or periodically.


*[REST]: Representational State Transfer: Introduced in 2000, it is the standard way of communicating clients to servers over http.
*[API]: Application Program Interface: The interface that allows clients (computers and smartphones) to communicate data with Jazz.
*[mp4 video]: Just a common video standard. This file can be "delivered" by Jazz and played with a browser plug-in, but Jazz does not "understand" it.
*[raw block]: Just a bunch of data, the content of a file with no context information.
*[http object]: The same block, but "decorated" with some attributes describing what it is, its language, author, copyright, etc.
*[tensor]: A set of data of the same type with a set of dimensions. Examples of tensors include numbers, vectors, matrices, images, videos and more.
*[node]: A computer running a Jazz server.
*[sharding]: Dividing a large data instrument over a set of nodes.
*[cluster]: A group of computers running Jazz servers that work together and are aware of each other.
*[filtering]: Selecting data that matches some condition.
*[aggregating]: Computing functions over the groups. E.g., Average income of women above 40 in each US State.
*[deep neural networks]: Aka. "deep learning". DNNs are architectures of functions. Typically, these networks are created by "learning" iteratively to do tasks by looking at examples, but any network of functions fits here.
*[DNN platforms]: Platforms providing functionality to "learn", "analyze" and "predict" using deep neural networks.
*[Caffe]: Caffe is a deep learning framework, originally developed by Yangqing Jia as part of his PhD at UC Berkeley. It is open source and written in C++.
*[TensorFlow]: TensorFlow is an open-source software library for machine learning developed by Google.
*[persistence]: The way data is stored in a permanent way (as opposed to volatile data in RAM). Data that can be backed up, restored, traced, verified, etc.
*[single process]: A process is the technical name for a "program" running. Typically, a process has multiple threads and they all see the same memory, unlike different processes which have to communicate between each other if they need to share data.
*[C++14]: The latest version of C++, an extension of the C computer language appeared in 1983 that is still today the language of use when efficiency is the main concern.
*[artifact]: The binary image of a program with all the dependencies needed to install and run it.
*[updated by a client]: A program connecting to Jazz could be constantly updating its data. This is one of the ways to gather data.
*[pull data sources]: Jazz itself can connect to public or private data sources and gather data.
*[on demand]: When a user needs that datum and expects Jazz to provide it.
*[periodically]: On a pre-programmed schedule.

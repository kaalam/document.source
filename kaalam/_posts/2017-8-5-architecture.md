---
layout: post
title: Architecture
description: Efficiency is never wrong
image: assets/images/pic02.jpg
---

You can find a bulleted list of the main architectural principles here. For a technical discussion, please go to the [user manual](/documentation/)
or the [unified programming reference landing page](http://20.1.71.31:8787/files/jazz/doc/index.html).

## Real-time, UX first
   1. Real-time not just for data, but for data driven value such as alerts and automated decisions.
   2. Accessible with just a smartphone or a web browser.
   3. Designed with personalized UX (AI, chatbots) in mind.

        ![link](/jazz/assets/images/ux-first.png){:width="600px"}


## Simplicity, with an enterprise mindset
   1. All nodes run the same software: persistence + machine learning (AI) + application server = Jazz.
   2. Only one product to install and understand with 100% open source code.
   3. Security: Jazz has a single point of control for access and permissions.

        ![link](/jazz/assets/images/simplicity.png){:width="600px"}


## Technically: No compromise!
   1. One single process, multithreaded, C++14 server.
   2. Implemented on the basis of reliable and largely tested open source software.
   3. Strict software engineering practices: static code analysis, unit testing, regression testing, stress testing, CI.


*[UX]: User Experience.
*[AI]: Artificial Intelligence: In this case, we refer to technology enabling applications such as machine translation, image recognition, self driving and many more.
*[persistence]: The way data is stored in a permanent way (as opposed to volatile data in RAM). Data that can be backed up, restored, traced, verified, etc.
*[machine learning]: In this context, the same as AI. The possibility of using Jazz to do complex computation over the data stored.
*[application server]: Jazz is an http server. It can store static pages, web applications, mobile applications and provide data services for all of them.
*[single process]: A process is the technical name for a "program" running. Typically, a process has multiple threads and they all see the same memory, unlike different processes which have to communicate between each other if they need to share data.
*[multithreaded]: Jazz is a single process and can use many CPU cores and even CPU chips. Jazz has a thread pool that can use all available computing resources (or less if intentionally restricted).
*[C++14]: The latest version of C++, an extension of the C computer language appeared in 1983 that is still today the language of use when efficiency is the main concern.
*[static code analysis]: The analysis for the source code to check compliance to standards, complexity and documentation metrics and detect bugs and issues.
*[unit testing]: The testing of all functions in an simulated environment.
*[regression testing]: The testing of complete systems, in this case, both server and client systems.
*[stress testing]: Testing under extreme conditions such as memory overruns, bandwidth overruns, disc space overruns, node failures, etc.
*[CI]: Continuous integration. The automated execution of testing, artifact building and deployment.

---
layout: post
title: API
description: REST API and clients
image: assets/images/pic04.jpg
---

Jazz has a strong need for communications, both as a server and as a client. As a client Jazz performs inter-node communications and data gathering
from external APIs. Both client and server communications support modern technologies including http 1.1 and IP v6. Jazz is built on top of widely
used http technologies: **[libcurl](https://curl.haxx.se/libcurl/)** for the client functionality
and **[libmicrohttpd]( https://www.gnu.org/software/libmicrohttpd/)** for the server side.

## As a server, Jazz provides

  - **Jazz server by functionality:**
    - Deliver static web pages.
    - Deliver data driven applications.
    - Deliver raw data.
    - Deliver AI computations based on internal or external data.

  - **Jazz server by internal service:**
    - Read/write data blocks using the internal key/value store.
    - Read/write/create data instruments abstracting the cluster and blocks levels.
    - Read/write/create neural networks using blocks, instruments and user uploaded data.
    - Create URLs to reference data blocks for reading.
    - Create served APIs to reference neural networks for reading and writing.

  - **Jazz server security:**
    - Trusted IPs for internal communications.
    - Support for basic authentication.
    - Support for digest authentication.

      ![link](/jazz/assets/images/security.jpg){:width="480px"}


*[inter-node]: Jazz nodes are coordinated as a cluster. This requires the nodes to communicate.
*[external APIs]: APIs from other services that provide data required by the applications running on the Jazz server. E.g., a EURO/USD rate.
*[http 1.1]: The latest version. HTTP/1.1 is a revision of the original HTTP (HTTP/1.0) that allows a single connection to access many objects.
*[IP v6]: Internet Protocol version 6 (IPv6) is the most recent version of the Internet Protocol (IP) with an address space 65536 times that of the previous version.
*[static web pages]: Web pages whose content is not created by querying data services, like this one.
*[data driven applications]: Web pages and mobile applications whose content is created from querying data services.
*[raw data]: The data stored returned "as is" or with just simple transformations like filtering and formatting.
*[AI computations]: Results computed by possibly complex operations such as image recognition.
*[external data]: Data defined to be outside the Jazz server, but the Jazz server has a way to access it on demand.
*[blocks]: The basic unit of data storage inside Jazz. Blocks have a type, like a raw binary file or a vector of 100 strings.
*[key/value store]: The internal persisted storage in the Jazz server. It is an extremely fast way to access data (value) given some unique identifier (key).
*[instruments]: An abstraction over the blocks and the nodes than allows defining functions over unlimited size data sets.
*[cluster]: A group of computers running Jazz servers that work together and are aware of each other.
*[neural networks]: Same as "deep neural networks". DNNs are architectures of functions. Typically, these networks are created by "learning" iteratively to do tasks by looking at examples.
*[uploaded data]: The data uploaded by a user. E.g., a face shot of herself for identification.
*[URLs]: Universal Resource Locators. Simply put: the address of a World Wide Web page.
*[served APIs]: The APIs the server exposes for the clients using it.
*[IPs]: In this case, IP (Internet Protocol) means IP address. Only the known addresses of the clients connecting inside the cluster are trusted.
*[basic authentication]: Authentication with a password (and typically a user name or another unique identifier) plus a session cookie.
*[digest authentication]: Authentication using some public key cryptography based mechanism.

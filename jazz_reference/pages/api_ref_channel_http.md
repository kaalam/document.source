---
title: API Reference - Channel base http
summary: Api Reference for the base "http" inside the container Channels
sidebar: mydoc_sidebar
permalink: api_ref_channel_http.html
---

## The Container `Channels`

`Channels` is a container doing block transactions across media (files, folders, the bash shell, http urls and zeroMQ servers). This
includes keeping a cluster of Jazz nodes as a whole where every node is aware of all the others and queries can be forwarded by just
including the node name. Any imaginable communication channel, including writing files and pushing them to github (using git in the bash
shell) is accessible. This includes all protocols supported by zeroMQ and libCURL.

* See C++ ref [Channels](/develop_jazz02/classjazz__elements_1_1Channels.html)

## The base `http`

Besides being an http server, Jazz is also an http client. The simplest mode of operation is just forwarding get(), put() and delete()
calls that are intended for other nodes in a Jazz cluster. This is done at the top API level by just adding a node name. E.g.,
get("///node_x//lmdb/things/this") will forward the call to the node_x (if anything is well configured see JAZZ_NODE_NAME_.., etc.)
and return the result just as if is was a local call. At the class level, this is done by forward_get(), forward_put() and forward_del().
You can also send simple GET, PUT and DELETE http calls to random urls by either using the get(), put() and remove() or using the Jazz http
server API GET "//http&https://google.com;"

The most advanced way to do it is creating a connection (similar to a "0-mq" pipeline) by put()-ing an **Index serialized as a Tuple**
to: //http/connection/a_name the index requires the mandatory key URL and the optional keys: CURLOPT_USERNAME, CURLOPT_USERPWD,
CURLOPT_COOKIEFILE and CURLOPT_COOKIEJAR (see https://curl.se/libcurl/c/CURLOPT_USERNAME.html and
https://everything.curl.dev/libcurl-http/cookies) Once the connection exists, you can get(), put() and remove() to just its name (without
the word connection). I.e, get(txn, "//http/a_name") or get(txn, "//http/a_name/args") will send the http GET to connection[URL] + "args".
Same for put() and remove().

{% include note.html content="An Index serialized as a Tuple is a <b>Tuple of two string vectors</b> of the same length named `key` and
`value`." %}

 If you remove("//http/connection/a_name"), you destroy the connection. get("//http/connection/a_name") returns an
**Index serialized as a Tuple**  with all the connection parameters.

## In terms of the Jazz server API

There are three ways:

* Inside the Jazz cluster, just use the API of another node like the API of the current node. E.g., `///tokyo_node//lmdb/base17/key55` This
will forward automatically.
* For easy URL (no cookies, authorization, etc.), just use the constant form GET, PUT or DELETE to `//http&http://url...;`
* For advanced control, just create the pipeline `my_pipe` programmatically and GET, PUT or DELETE to `//http/my_pipe/`

{% include important.html content="http operation must be enabled via configuration by setting ENABLE_HTTP_CLIENT to something non-zero." %}

{% include links.html %}

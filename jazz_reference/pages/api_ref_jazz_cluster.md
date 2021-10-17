---
title: API reference - Using Jazz as a cluster
summary: How Jazz nodes talk to each other
sidebar: mydoc_sidebar
permalink: api_ref_jazz_cluster.html
---

## Jazz as a cluster (philosophy)

Since Jazz is both an http client and an http server. Obviously, all nodes understand the binary details of tensors, kinds, tuples.
Furthermore, they and can "speak" the language of the Jazz API. The only other thing you need to make everything work, is configuring a
cluster. Once a cluster is configured, all Jazz nodes have a unique name across the cluster and every node knows the IP and port of every
other node by its name.

Based on that, you can make API calls like GET `///frankfurt//lmdb/base/key=//lmdb/my_base/my_key` which is an assignment across nodes.
Or even `///frankfurt//lmdb/baseXX/keyYY=///sydney//lmdb/baseSS/keyTT` performed in a third (neither `frankfurt` nor `sydney`) node.
You can also PUT to `///sydney//lmdb/baseSS/keyTT.raw` or GET from `///frankfurt//code/fun(//lmdb/ee/k)` or `///frankfurt//code/fun(&[3])`

Compared to what other systems provide: automatic replication, sharding, fault tolerance, etc. this looks very low level. Well, it is.
When Jazz was created, it had "the burden" of having to provide reliable distributed storage out of the box. Now we focus Jazz in a
different way: You can create the shared, replicated, fault tolerant storage **in Jazz**. Ultimately, **only if you really need it**. There
are many alternatives that provide these features "out of the box". The only thing Jazz provides out of the box is what is described in
this page. Everything else, including more intelligent ways to distribute data across agents as agents become more intelligent, has to be
created **inside Jazz**.


## Configuring a Jazz cluster.

Is just defining JAZZ_NODE_NAME_#, JAZZ_NODE_IP_# and JAZZ_NODE_PORT_# for each Jazz node in the `jazz_config.ini` file (or whatever
file you pass to the server at starting time). The `#` is replaced by a decimal number starting with 1 up to the number of nodes in the
cluster. You have to use all the consecutive numbers, the parser will stop looking at the first non match.

All names must be unique, IPs are just strings and should work when used in a URL, ports are integers.

Unless you do it intentionally for some reason, the cluster configuration should have the same values for these constants in all
the nodes **and a different JAZZ_NODE_MY_NAME** defining which of the nodes is the current node.


## The Golden Rules.

 * The node name defined in a `///node/...` applies to everything until an assignment `=` character is found.
 * In absence of a `///node/...` the node is the node you are talking to.
 * A node definition can only be the first thing or the first thing after a `=`.


### As a consequence:

 * In GET `///frankfurt//code/fun(//lmdb/ee/k)` the entity `ee` is in `frankfurt`, not in the current node.
 * In GET `///frankfurt//tt/k=//lmdb/ee/k` the entity `ee` is in the current node, not in `frankfurt`.
 * GET `///frankfurt//tt/k=///frankfurt//lmdb/ee/k` is the right way to assign from `frankfurt` to `frankfurt`.
 * GET `//code/fun(///frankfurt//lmdb/ee/k)` is malformed.


## Assignment is your friend

To keep it simple, not everything can be done in just one line. We just saw `//code/fun(///frankfurt//lmdb/ee/k)` is malformed. You
may want to pass a block that is in `frankfurt` as an argument to a function in your local node. The way to do it is the two liner:
GET `deque\xx\~last=///frankfurt//lmdb/ee/k)` and GET `//code/fun(deque\xx\~plast)`.

Note that **you created a volatile local** block automatically by pushing it to an existing queue named `xx`. This avoids having to give
it a name (which could already exist and therefore replace an existing item). It the second line, **you destroyed the block** by reading
it using `~plast` (pop last) rather than just `~last`.

{% include links.html %}

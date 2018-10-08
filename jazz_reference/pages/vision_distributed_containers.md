---
title: Distributed containers
summary: Introducing the classes that abstract clusters of Jazz servers as objects that can be computed in any of the nodes and automatically distribute computation.
sidebar: mydoc_sidebar
permalink: vision_distributed_containers.html
---

## Distributed containers

Jazz has support for distribution. A Jazz cluster is just a **network of Linux boxes running Jazz** and sharing a configuration that includes
the cluster definition. All Jazz nodes understand where (in possibly more than one node) every block of a distributed keepr **should be**.

{% include note.html content="When used via a REST API, **all nodes support all queries**. A query directed to the wrong node will simply be
redirected to a node that should be able to handle it." %}

### Columns and dataframes

In Jazz, the first dimension of any block is special and divides the tensor in **rows**. Rows that can be anything. In a vector of videos,
a row is a video, in an image, a row is a row of pixels, in a file, a row is a byte. Jazz supports **selecting rows** and operating on
row selections as a first class citizen. (E.g., It can return a selection from a persisted block without ever copying the block or
accessing any non selected elements.)

A "vertical" chain of blocks of any type can be abstracted as a **column** (JazzColumn), and therefore distributed across a **cluster**
(JazzCluster), given:

* All blocks have the **same type and dimensions**.
* There is an explicit or implicit **unique identifier for each row**.

Examples of **explicit identifiers** include all kind of numeric or string codes, also Unix time is an example of identifier to store time
series and events. An **implicit identifier** is something created automatically similar to an index in a relational db.

A column is created by defining either a **DenseMapping** or a **SparseMapping** over the identifier. A **DenseMapping** will allocate
a row for any existing value of the identifier, which may contain NA values if not informed. A **SparseMapping** is a more efficient way
to represent sparse data where only exiting rows are stored together with an index identifying each row.

{% include note.html content="A **dataframe (JazzDataframe) is a list of columns** that share the same mapping. Since columns are tensors,
it is possible to have a five columns dataframe where a row is: 1. a video, 2. a sound track, 3. a label, 4. a multiple choice of tags, 5.
a free text description. The **video and the soundtrack are tensors of raw data**, not links to external files." %}

### Filesystems, remote sources, distributed filesystems

A **JazzFileSystem** is an abstraction to manage files in the Linux box running Jazz as JazzBlocks without necessarily copying their content.
Since blocks have attributes, we can tag them to specify what functions can be applied to each file. This typically includes decompressing,
compressing, scaling images, etc.

{% include note.html content="Given a **tar.gz** file containing 10K **jpeg** images with different sizes and a **csv** file with labels
corresponding to them, we want to build a dataframe with two columns: **image** (with identical dimensions) and **label** for training a
deep learning model. With appropriate tar.gz, jpeg and image scaling support this can be defined **inside Jazz**. Jazz extracts, decodes
and scales images on demand. The same applies to **creating a synthetic video** and delivering it coded with as **mp4** and tagged with
a **mime type** as an http resource." %}

A **JazzRemoteSource** is an http client connecting to a REST API and storing the result as a block. The connection can be initiated
periodically or on demand. The result is typically filtered by a validation function written in Bebop.

A **JazzClusterFileSystem** is a JazzFileSystem interface that uses a DenseMapping to shard the file names across a cluster. This can be
used to keep data as raw files across a cluster. E.g,, media file uploaded by users. These files can later be converted into more efficient
representations (blocks in JazzSources).

{% include links.html %}

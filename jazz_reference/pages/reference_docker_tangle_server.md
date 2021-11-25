---
title: Jazz (TNG) The Tangle Server
summary: Updated reference of The Tangle Server
sidebar: mydoc_sidebar
permalink: reference_docker_tangle_server.html
---

{% include callout.html content="**Jazz à la carte** is intended to be a series of Jazz servers maintained as Docker images through
continuous integration including such things as \"voice recognition\", \"text to speech\", etc. This is the second member of the
series." %}

## What is **The Tangle**

It is an entangled collection of English text: dictionaries and grammar, books, wikipedia articles, movie subtitles, facts, Q&A, ...
See [poster](https://raw.githubusercontent.com/kaalam/kaalam/master/the_tangle.pdf)

## How to check for the latest version?

Follow [this link](https://hub.docker.com/r/kaalam/jazz_tng/tags) and note the version number.

## How to run it

You have to use a different docker image `kaalam/jazz_tng:0.5.3` instead of `kaalam/jazz_lss:0.5.3` which is a server with some extra
software to download and decompress the datasets.

The process is three step:

  - downloading and decompressing
  - compiling (storing the serialized data sources as binary in the LMDB database inside Jazz)
  - verifying

### Downloading and decompressing

Run a docker container by typing:

```
docker run -ti -v ~/tmp/the_tangle:/home/jazz/jazz_dbg_mdb kaalam/jazz_tng:0.5.3 /bin/bash
```

where `~/tmp/the_tangle` is any existing empty local path you wish to use to store everything (60 Gb required). Inside the docker
container run the script `./download_and_store.sh` and exit when complete.

You are ready for compiling.


### Compiling

Install the python package with `pip install thetangle`. Run the TNG server with:

```
docker run -p8899:8899 -v ~/tmp/the_tangle:/home/jazz/jazz_dbg_mdb kaalam/jazz_tng:0.5.3
```

using the same `~/tmp/the_tangle` folder you used for downloading.

Then, open a python interpreter and run

```python
from thetangle.TheTangle import CompileTheTangle
CompileTheTangle().compile()
```

in the same machine that is running the server.


### Verifying

You already have a python package named `thetangle` installed and a server running as you did in the previous step.

Now, you can run a python [welcome](https://github.com/kaalam/thetangle/blob/master/python_examples/welcome.py) example

<br/>

{% include links.html %}

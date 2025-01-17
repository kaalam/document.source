---
title: How Can I Extend Jazz?
summary: Writing Jazz uplifts
sidebar: mydoc_sidebar
permalink: using_extend.html
---

## Developing Jazz uplifts

### 0. Prerequisites

First, you need:

  * Understanding what [uplifting](vision_uplifts.html) is.
  * Prepare a [Jazz development ](using_compile.html) environment.
  * Get familiar with the [Development documentation](/develop/).

### 1. Placing your source tree

In the previous step, you have created a directory tree using `git clone https://github.com/kaalam/Jazz.git`. This tree will become
the source of your customized Jazz server. Once everything is configured, the `make` command will build the customized server. Also,
your IDE will be aware of the whole project, which allows you to navigate the source code and debug it.

At the moment, your project has a subfolder called `uplifts` that contains just a `README.md` file. That file is part of the Jazz
project, the rest is not.

```txt
uplifts/
└── README.md
```

Inside the `uplifts` folder, you will create new folders `api` and `models_api` (you can create both or just one depending on what you
want to uplift). You will get a sub-tree like:

```txt
├── uplifts
│   ├── api
│   │   ├── internal_api.cpp
│   │   └── internal_api.h
│   ├── models_api
│   │   ├── internal_models.cpp
│   │   └── internal_models.h
│   └── README.md
```

The names of the files, also putting each model in a separate file, is your choice, but the folder names are fixed. Of course, you can
create subfolders with whatever you need, but the files that define the names of your classes must be exposed as in the example.

`config` will look for the names and relate them with their parents and object names. To make this detection possible, just write simple
class definitions like:

```cpp
class MyModel : public Model {

    public:

         MyModel(pLogger a_logger, pConfigFile a_config);
        ~MyModel();

        virtual pChar const id();

    // ... whatever you need goes here
};


class MyModelsAPI : public ModelsAPI {

    public:

         MyModelsAPI(pLogger a_logger,
                     pConfigFile a_config,
                     pChannels a_channels,
                     pVolatile a_volatile,
                     pPersisted a_persisted);
        ~MyModelsAPI();

        virtual pChar const id();

    // ... whatever you need goes here
};


class InternalAPI : public jazz_main::API {

    public:

         InternalAPI(pLogger	 a_logger,
                     pConfigFile a_config,
                     pChannels	 a_channels,
                     pVolatile	 a_volatile,
                     pPersisted	 a_persisted,
                     pCore		 a_core,
                     pModelsAPI	 a_model);
        ~InternalAPI();

        virtual pChar const id();

    // ... whatever you need goes here
};
```

### 2. Creating a Makefile

To create a makefile that understands your new classes, you just have to run `./config.sh` again. We assume that in the prerequisites
you already solve all the library dependencies. Now, you only have to let it detect the new modules and names.

{% include important.html content="Each time you modify class names for inherited class or file names, you have to run `./config.sh`
again!" %}

### 3. Adding version control

At the level of your `(project)/uplifts` folder you start your own git repository. Typically, with `git init`, add a remote, etc.
This folder is already ignored by the main Jazz repository, with the exception of the `README.md` file. You will typically want to create
your own `.gitignore` file at this level to, at the minimum, hide you IDE's configuration files. Include `.vscode` in it, the rest of
this page assumes VSCode as the IDE.

### 4. Making the IDE in each tree aware of the other

By default, your main project is not aware of the uplifts in the IDE even if `make` works ok. You will have to create a
`c_cpp_properties.json` in `.vscode` with something like:

```json
{
    "configurations": [
        {
            "name": "Jazz testing",
            "defines": ["DEBUG", "CATCH_TEST"],
            "intelliSenseMode": "linux-gcc-x64",
            "cStandard": "c17",
            "cppStandard": "c++17",
			"includePath": ["${workspaceFolder}/server", "${workspaceFolder}/uplifts"]
        }
    ],
    "version": 4
}
```

You may also want to have debugging configuration to run tests, run the server in debug mode or attach to a running server. This is
controlled by the `launch.json` file in the `.vscode` folder, something like:

```json
{
	// Use IntelliSense to learn about possible attributes.
	// Hover to view descriptions of existing attributes.
	// For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
	"version": "0.2.0",
	"configurations": [

		{
			"name": "(gdb) Attach",
			"type": "cppdbg",
			"request": "attach",
			"program": "${workspaceFolder}/server/djazz",
			"processId": "${command:pickProcess}",
			"MIMode": "gdb",
			"setupCommands": [
				{
					"description": "Enable pretty-printing for gdb",
					"text": "-enable-pretty-printing",
					"ignoreFailures": true
				}
			]
		},
		{
			"name": "(gdb) Launch",
			"type": "cppdbg",
			"request": "launch",
			"program": "${workspaceFolder}/server/tjazz",
			"args": [],
			"stopAtEntry": false,
			"cwd": "${workspaceFolder}/server",
			"environment": [],
			"MIMode": "gdb",
			"setupCommands": [
				{
					"description": "Enable pretty-printing for gdb",
					"text": "-enable-pretty-printing",
					"ignoreFailures": true
				}
			]
		},
		{
			"name": "(gdb) Launch DBG server",
			"type": "cppdbg",
			"request": "launch",
			"program": "${workspaceFolder}/server/djazz",
			"args": ["start"],
			"stopAtEntry": false,
			"cwd": "${workspaceFolder}/server",
			"environment": [],
			"MIMode": "gdb",
			"setupCommands": [
				{
					"description": "Enable pretty-printing for gdb",
					"text": "-enable-pretty-printing",
					"ignoreFailures": true
				}
			]
		}
	]
}
```

### 5. Testing the uplift

To make testing the uplift identical to testing the main project, just use the same logic:

* Create a `test` folder in each of you folders, `api` and `models_api`.
* Write Catch2 tests in the `test` folder.
* Include the test conditionally in the .cpp file, like:

```cpp
#if defined CATCH_TEST
#include "../uplifts/models_api/tests/test_my_model.ctest"
#endif
```

Also, to make the IDE find the sources when editing the test files, add a second include to the .h file, like:

```cpp
#pragma once
#include "./uplifts/models_api/my_model.h"
```

Once you have that, you can just `make tjazz` and run it or debug it in the IDE.

### 6. Building, deploying

Once you have a debugged your uplifts, you can build the server with `make jazz` and deploy it. You could install it in the
machine where you are developing with `make install` or build a Docker with it as explained in
the [Docker documentation](reference_docker_how_to_build.html).

{% include tip.html content="When you create a docker image, you will probably want to edit the server configuration and the static
content available by default that are in the `server/config/jazz_config.ini` file and `server/config/www` folder." %}

<br/>

{% include links.html %}

---
title: "Development environment for DE10-Standard FPGA board on Linux"
date: 2019-02-17T13:05:17+03:00
draft: true
---

Memo:
* Dockcross used to cross compile for armv7 architecture. Image is
    [here](https://hub.docker.com/r/dockcross/linux-armv7/). Follow quidelines in
    the readme and place script from it under ~/bin/ folder to make it available on
    PATH. I named this file to `de10-compile`.
* Code which needs to include Altera header files. These files need to be
    mounted from host machine to container and it's makefile edited accordingly.

If you inspect provided makefile, it's clear we need to set `SOCEDS_DEST_ROOT`
environment variable which needs to point to soc eds installation root. Altera
hardware source files are located under
`install-location/16.1/embedded/ip/altera/hps/altera_hps/hwlib/`. So we need to
set following:
```
export SOCEDS_DEST_ROOT="/home/kazooie/intelFPGA_lite/16.1/embedded"
```
After this edit this `HWLIBS_ROOT` line in makefile to this:
```
HWLIBS_ROOT = $(SOCEDS_ROOT)/mount/ip/altera/hps/altera_hps/hwlib
```
We added mount folder to the path. This is the folder we use to mount volume
inside container. This makes `HWLIBS_ROOT` in makefile point to correct folder where Altera source
files are located.

Now we know the location of source files and have them setup, we need to mount
that location to the docker container as a volume with following:
```
de10-compile --args "-v $SOCEDS_DEST_ROOT:/mount" -- make
```
Run this command in project source folder. `--args` flag gives additional
arguments to the `docker run` command. With this flag we mount a volume from the
host machine using environment variable set above. And after `--` we specify
actual command runned inside the container. If everything went well, it should
cross compile source code without errors.

TODO: Clean this up and also give example makefile where unnessecary enviroment
variables are not included.

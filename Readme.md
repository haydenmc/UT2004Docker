# UT2004 Dedicated Server Windows Docker Image

First crack at a Docker image for a UT2004 server.

Slap your game directory in `Game/` and build the image with

```cmd
docker build -t ut2004 .
```

When you run the image, it will automatically place server config files (`UT2004.ini`, etc.) in a volume called `_data`. On Windows, you can usually find this in `%ProgramData%\docker\volumes`.

Recommend running on a transparent network interface and setting a static IP to port forward to. Limiting CPU and memory is also a decent idea just in case something goes haywire.

Example run:

```cmd
docker run --name ut2004 --detach --restart always --cpus 1 --memory 1GB --network=tlan --hostname ut2004 --ip 192.168.1.4 ut2004
```

To set it up on a different port (like 7797), do this
```
docker run --name ut2004 --restart always --cpus 1 --memory 2GB --network=statictlan --hostname ut2004 --ip 192.168.1.4 -p 7797:7797/udp ut2004
```
and then change the port in UT2004.ini
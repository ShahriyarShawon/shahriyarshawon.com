+++
title = "How to create Minecraft 1.18 server with domain name in Arch Linux"
date = "2022-07-02"
tags = ["linux", "arch", "minecraft"]
+++

This tutorial assumes that you have a vps or some type of system where
arch linux is setup and you are able to access it using `ssh` or any
other means. This is not an arch setup tutorial. 


## You'll Need
- On Server
    - screen
    - curl
    - jdk (16>=)
    - vim/nano

- On Local Machine
    - ssh client (putty or just ssh command from terminal)

- A namecheap domain

## Get Everything Installed
Remember this is a tutorial for Arch Linux so I'll be providing the package name for `pacman` and not `apt`.
```sh
sudo pacman -s screen curl jdk-opendjk nano
```
Substitute out `nano` for `vim` if needed and feel free to leave out `curl` if its already installed.

## Setup Server
- Get Vanilla 1.18 `server.jar` from 
[minecraftjars.com](https://serverjars.com/)
    - you can right click download under 1.18 Vanilla and click copy
    link address
    - keep it copied for now
- make directory for server
```sh
mkdir mcserver
cd mcserver
curl -o server.jar https://serverjars.com/api/fetchJar/vanilla/1.18
java -jar server.jar
```
That last command will generate the `eula.txt` document that you need
to edit. Open `eula.txt` in a text editor you installed from before and 
change false to true next to `eula=`

You can now run the `java -jar server.jar` command againt now but lets
add `-Xmx3G` to tell java to use 3GB of ram for the server. You can 
replace the 3 to however much ram you want to dedicate towards the 
server.

The final command ends up being 
```sh
java -jar -Xmx3G server.jar
```

I don't want to type out this command everytime I want to start up my
server so I put this command in a file called `runserver.sh`

## Startup Script
```sh
# create runserver.sh file
touch runserver.sh
nano runserver.sh
```

Next put the following into the file

```sh
#!/bin/bash
java -jar -Xmx3G server.jar
```

Save and exit your file and then run `chmod +x runserver.sh` to make
your script executable.

To run your script, make sure you are the in the correct directory 
using the `ls` command and then run the script with `./runserver.sh`

Before you do that, you probably want to run the script in `screen` so 
you don't have to stay connected to the server to have the server running.

## Keep server running without ssh connection
In your server directory run the `screen` command, this will start a 
new bash session that will stay running in the background even if you
detach from it.

After running `screen` run your startup script with `./runserver.sh`
after it's loaded, you can press `ctrl+a d` to detach from that session.
This'll bring you back to your normal bash session. If you want to reattach to the `screen` window, you can do `screen -r`.

For more information on `screen`, you can run `man screen` or `info 
screen` or go to the [GNU Docs for screen](https://www.gnu.org/software/screen/manual/screen.html)

## Connect to Server using domain name
Taken from [Namecheap Article](https://www.namecheap.com/support/knowledgebase/article.aspx/9765/2208/how-can-i-link-my-domain-name-to-a-minecraft-server/):

>Mapping a subdomain (e.g., mc.yourdomain.tld, www.yourdomain.tld, etc.) to your Minecraft server.
>
>Let’s check how records should be changed to have the mc.yourdomain.tld subdomain linked to the Minecraft server.
>
>Please note that mc.yourdomain.tld is an example, and all settings should be adapted to your subdomain. Thus, if you wish to connect a subdomain, add >your subdomain to Protocol and Target or Protocol only if you have a custom Target.
>
>The A record set for the subdomain mc.yourdomain.tld has the following values:
>
>Host : mc
>
>Value: IP address of your Minecraft server
>
>TTL: Automatic or 30 min (our default TTL)
>
>
>The SRV record should look as follows in this case:
>
>Service: _minecraft
>
>Protocol: _tcp.mc
>
>Priority: 0
>
>Weight: 5
>
>Port: [custom port]
>
>Target: [your domain with the subdomain]
>
>TTL: Automatic or 30 min (our default TTL)
>

![namecheap changes](https://namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E//media/2021-01-11_09-04.png)

NOTE: `[custom port]` is the default 25565 if you didn't change it in `server.properties`

This could take around 30 minutes to kick into effect. After that you
should be able to connect using mc.domain.tld

eg.

minecraft.shahriyarshawon.com

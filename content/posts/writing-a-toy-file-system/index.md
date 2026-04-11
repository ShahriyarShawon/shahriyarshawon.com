---
title: Writing a toy File System
date: 2026-04-09
tags: [operating-systems, rust]
description: 
---

# Writing a toy Filesystem (WIP)

I'm trying to make, what I'm calling, a toy filesystem. It's going to be file based (a file on my linux machine will operate as a disk),
a rust program will be the proprietor of managing the data, it will be very basic, it will be very small, it will suck.

I thought it would be a cool project to do with minimal exposure to file systems.

The extent of my knowledge of filesystems was overviews in 2 operating systems classes (Linux and Inferno) in undergrad which at this point in 2026 
was about 2-3 years ago now. I'm using the Tanenbaum Minix Book as a sort of guide but mostly for architecture. 
The operations (read, write, mkdir, etc.) will be all my code. 

Things I will not be worrying about for dfs (I'm gonna call this file system dfs: `Disk File System`)
- permissions
- ownership
- multi level data storage (indirect blocks)
- any form of error correction
- Linux-like file descriptors (I'm not sure how to separate responsibilities so I'm gonna make the file system controller not care)

### Superblock Structure

<video controls>
  <source src="Superblock.mp4" type="video/mp4">
</video>

### Locating a free block in block bitmap
<video controls>
  <source src="LocateBlockInMap.mp4" type="video/mp4">
</video>

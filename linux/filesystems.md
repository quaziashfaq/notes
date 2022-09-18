# Filesystems

Different types of filesystems supported by Linux:

- Conventional disk filesystems: ext2, ext3, ext4, XFS, Btrfs, JFS, NTFS, etc.
- Flash storage filesystems: ubifs, JFFS2, YAFFS, etc.
- Database filesystems
- Special purpose filesystems: procfs, sysfs, tmpfs, squashfs, debugfs, etc.

## Partitions and Filesystems

A partition is a physically contiguous section of a disk, or what appears to be so in some advanced setups.

A filesystem is a method of storing/finding files on a hard disk (usually in a partition). 

One can think of a partition as a container in which a filesystem resides, although in some circumstances, a filesystem can span more than one partition if one uses symbolic links, which we will discuss much later.

A comparison between filesystems in Windows and Linux is given in the accompanying table:

 

 |                             | Windows     | Linux                  |
 |-----------------------------|-------------|------------------------|
 | Partition                   | Disk1       | /dev/sda1              |
 | Filesystem Type             | NTFS/VFAT   | EXT3/EXT4/XFS/BTRFS... |
 | Mounting Parameters         | DriveLetter | MountPoint             |
 | Base Folder (where OS is C) | stored:\    | /                      |
 |-----------------------------|-------------|------------------------|

## FHS
Linux systems store their important files according to a standard layout called the Filesystem Hierarchy Standard (FHS), which has long been maintained by the Linux Foundation. For more information, take a look at the following document: "Filesystem Hierarchy Standard" created by LSB Workgroup. Having a standard is designed to ensure that users, administrators, and developers can move between distributions without having to re-learn how the system is organized.

Linux uses the ‘/’ character to separate paths (unlike Windows, which uses ‘\’), and does not have drive letters. Multiple drives and/or partitions are mounted as directories in the single filesystem. Removable media such as USB drives and CDs and DVDs will show up as mounted at /run/media/yourusername/disklabel for recent Linux systems, or under /media for older distributions. For example, if your username is student a USB pen drive labeled FEDORA might end up being found at /run/media/student/FEDORA, and a file README.txt on that disc would be at /run/media/student/FEDORA/README.txt.

| Directory | Purpose                                                       |
|-----------|---------------------------------------------------------------|
| /         | Root directory of the entire filesystem hierarchy             |
| /bin      | Essential user command binaries                               |
| /boot     | Static files of the boot loader                               |
| /dev      | Defice files                                                  |
| /etc      | Host-specific configuration system                            |
| /home     | User home directories                                         |
| /lib      | Essential shared libraries and kernel modules                 |
| /media    | Mountpoint for removable media                                |
| /mnt      | Mountpoitn for a temporary mounted filesystems                |
| /opt      | Add-on application software pacakges                          |
| /sbin     | System binaries                                               |
| /srv      | Data for services provided by this system                     |
| /tmp      | Temporary files                                               |
| /usr      | (Multi-)user utilities and applications                       |
|           | (Requirred directories bin, include, lib, local, sbin, share) |
| /var      | Variable files                                                |
| /root     | Home directory for the root user                              |
| /proc     | Virtual filesystem documenting kernel                         |
|           | and process status as text files                              |
|-----------|---------------------------------------------------------------|


```
$ tree -aCd -L 1 /var
```

All installers set up some initial security features on the new system. One basic step consists of setting the password for the superuser (root) and setting up an initial user. In some cases (such as Ubuntu), only an initial user is set up; direct root login is not configured and root access requires logging in first as a normal user and then using sudo, as we will describe later. Some distributions will also install more advanced security frameworks, such as SELinux or AppArmor. For example, all Red Hat-based systems including Fedora and CentOS always use SELinux by default, and Ubuntu comes with AppArmor up and running. 

Many installers can do an installation completely automatically, using a configuration file to specify installation options. This file is called a Kickstart file for Red Hat-based systems, an AutoYAST profile for SUSE-based systems, and a Preseed file for Debian-based systems.



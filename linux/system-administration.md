[Up](./readme.md)

# Topics
  - [Managining files and directories](#managing-files-and-directories)
  - [Limiting the resources](#limiting-the-resources)
  - [LVM Administration](#lvm-administration)
  - [Raid Management with mdadm](#raid-management-with-mdadm)

# Managing files and directories

## Creating useful aliases and add them in $HOME/.bashrc
```
alias c='clear'

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias l='ls -CF'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

```


## Copying dot-files (hidden files) without creating a new directory in the target locaiton
`$ cp -rv /etc/skel/. /home/bob/data`


chmod modifiers files: changes the permissions for the files according to the provided modifiers; we've seen +x to make the file executable
*chown user files*: changes the owner of the files to the given user
chgrp group files: changes the group of the files to the given group


## /etc/profile.d : Changing default behaviour of the system for all users
### Make sure that this command gets executed for any user that logs in to the system:
`$ sudo vi /etc/profile.d/welcome.sh`

### Disable the beeping sound in the system console
```
$ sudo vim /etc/profile.d/disable-beep.sh
setterm -blength 0
```

## Changing default keyboard
```
$ sudo vim /etc/vconsole.conf
KEYMAP="us-dvorak"
```

# Limiting the resources
`$ sude vim /etc/security/limits.conf`

At the end the of the file, you will see some examples of limiting resources for the users.
`<domain>   <type>  <item>  <value>`

`domain` means the name of users or groups
`type` is hard limit or soft limit or -
`item` <- What this limit is for?
`value` <- how many/much resources can be allocated?



# LVM Administration
```
$ sudo lvmdiskscan
$ sudo pvcreate /dev/vd{b,c,d,e}
$ sudo pvs
$ sudo vgcreate my_vg /dev/sdb /dev/sdc
$ sudo vgs
$ sudo pvcreate /dev/sdd
$ sudo vgextend my_vg /dev/sdd
$ sudo vgs
$ sudo vgreduce my_vg /dev/sdd
$ sudo vgs
$ sudo pvremove /dev/sdd


$ sudo lvcreate --size 2g --name storage_vol  my_vg
$ sudo lvcreate --size 6g --name backup_vol my_vg
$ sudo lvs

$ sudo mkfs.xfs /dev/my_vg/storage_vol
$ sudo lvresize --resizefs --size 3g /dev/my_vg/storage_vol
```

# Raid Management with mdadm

Installing mdadm
`[root@dove ~]# dnf install mdadm`

Listing the disks
```
[root@dove ~]# lsblk -a
NAME        MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sr0          11:0    1  863M  0 rom
nvme0n1     259:0    0   20G  0 disk

├─nvme0n1p1 259:1    0    1G  0 part /boot
└─nvme0n1p2 259:2    0   19G  0 part
  ├─cs-root 253:0    0   17G  0 lvm  /
  └─cs-swap 253:1    0    2G  0 lvm  [SWAP]
nvme0n2     259:3    0    1G  0 disk
nvme0n3     259:4    0    1G  0 disk
nvme0n4     259:5    0    1G  0 disk
nvme0n5     259:6    0    1G  0 disk
nvme0n6     259:7    0    1G  0 disk
nvme0n7     259:8    0    1G  0 disk
nvme0n8     259:9    0    1G  0 disk
nvme0n9     259:10   0    1G  0 disk
```

Creating a __RAID 0__ device
```
[root@dove ~]# mdadm --create /dev/md0 --level=0 --raid-devices=3 /dev/nvme0n{2..4}
mdadm: Defaulting to version 1.2 metadata
mdadm: array /dev/md0 started.
[root@dove ~]# lsblk
NAME        MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT
sr0          11:0    1  863M  0 rom
nvme0n1     259:0    0   20G  0 disk
├─nvme0n1p1 259:1    0    1G  0 part  /boot
└─nvme0n1p2 259:2    0   19G  0 part
  ├─cs-root 253:0    0   17G  0 lvm   /
  └─cs-swap 253:1    0    2G  0 lvm   [SWAP]
nvme0n2     259:3    0    1G  0 disk
└─md0         9:0    0    3G  0 raid0
nvme0n3     259:4    0    1G  0 disk
└─md0         9:0    0    3G  0 raid0
nvme0n4     259:5    0    1G  0 disk
└─md0         9:0    0    3G  0 raid0
nvme0n5     259:6    0    1G  0 disk
nvme0n6     259:7    0    1G  0 disk
nvme0n7     259:8    0    1G  0 disk
nvme0n8     259:9    0    1G  0 disk
nvme0n9     259:10   0    1G  0 disk
```

Creating __xfs__ filesystem on top of `/dev/md0` and mounting it
```
[root@dove ~]# mkfs.xfs /dev/md0
log stripe unit (524288 bytes) is too large (maximum is 256KiB)
log stripe unit adjusted to 32KiB
meta-data=/dev/md0               isize=512    agcount=8, agsize=98176 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=1, sparse=1, rmapbt=0
         =                       reflink=1    bigtime=0 inobtcount=0
data     =                       bsize=4096   blocks=784896, imaxpct=25
         =                       sunit=128    swidth=384 blks
naming   =version 2              bsize=4096   ascii-ci=0, ftype=1
log      =internal log           bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=8 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0

[root@dove ~]# mount /dev/md0 /mnt
[root@dove ~]# findmnt /mnt
TARGET SOURCE   FSTYPE OPTIONS
/mnt   /dev/md0 xfs    rw,relatime,seclabel,attr2,inode64,logbufs=8,logbsize=32k,sunit=1024,swidth=3072,noquota
```

Unmounting and closing it
```
[root@dove ~]#
[root@dove ~]# umount /mnt
[root@dove ~]# mdadm --stop /dev/md0
mdadm: stopped /dev/md0
```

# Encrypted Storage

## Plain Encrypted Disk

Create a encrypted disk
`$ sudo cryptsetup --verify-passphrase open --type plain -dev/vde mysecuredisk`

Create a filesystem
`$ sudo mkfs.xfs /dev/mapper/mysecuredisk`

Mount the disk
`$ sudo monut /dev/mapper/mysecuredisk /mnt`

Once completed, unmount and close it
```
$ sudo umonut /mnt
$ sudo cryptsetup close mysecuredisk
```

## luksFormat Encrypted Disk
```
$ sudo cryptsetup luksFormat /dev/vde
$ cryptsetup
$ sudo cryptsetup luksChangeKey /dev/vde
$ sudo cryptsetup open /dev/vde mysecuredisk
$ sudo mkfs.xfs /dev/mapper/mysecuredisk
$ sudo cryptsetup close myceruedisk
```




# Swapspace managing
- How to convert a block device as swap space?  
  ``` sh
  $ mkswap /dev/sdb2
  $ swapon /dev/sdb2
  ```
  
  
- How to increase swap size (/swapfile)  
  ```
  $ ls -lh /swapfile 
  -rw-------. 1 root root 2.0G Dec  4  2020 /swapfile
  
  $ sudo dd if=/dev/zero of=/swapfile bs=1M count=1024 oflag=append conv=notrunc
  1024+0 records in
  1024+0 records out
  1073741824 bytes (1.1 GB, 1.0 GiB) copied, 1.40341 s, 765 MB/s
  
  $ ls -lh /swapfile
  -rw-------. 1 root root 3.0G Aug 30 16:51 /swapfile
  
  $ sudo free -m
                total        used        free      shared  buff/cache   available
  Mem:            968         175          73           3         720         648
  Swap:          2047          11        2036
  ```
    
    
    
  The file size has increased by 1 GB but the actual swap space has not increased. So we need to recreate the swap filesysstem.  
  ```
  $ sudo swapoff /swapfile
  $ sudo mkswap /swapfile 
  mkswap: /swapfile: warning: wiping old swap signature.
  Setting up swapspace version 1, size = 3 GiB (3221221376 bytes)
  no label, UUID=6bd3923e-85e5-4b74-af71-529da8f24318
  
  $ sudo swapon /swapfile
  $ sudo free -m
                total        used        free      shared  buff/cache   available
  Mem:            968         180          62           8         726         639
  Swap:          3071           0        3071
  ```

# Hardening
## SELinux
SELinux is a Mandatory Access Control (MAC) system, developed by the NSA. SELinux was developed as a replacement for Discretionary Access Control (DAC) that ships with most Linux distributions.

The difference between DAC and MAC is how users and applications gain access to machines. Traditionally, the command sudo gives a user the ability to heighten permissions to root-level. Root access on a DAC system gives the person or program access to all programs and files on a system.

A person with root access should be a trusted party. But if security has been compromised, so too has the system. SELinux and MACs resolve this issue by both confining privileged processes and automating security policy creation.

SELinux defaults to denying anything that is not explicitly allowed. SELinux has two global modes, permissive and enforcing. Permissive mode allows the system to function like a DAC system, while logging every violation to SELinux. The enforcing mode applies a strict denial of access to anything that isn’t explicitly allowed. To explicitly allow certain behavior on a machine, you, as the system administrator, have to write policies that allow it. This guide provides a brief and basic introduction to commonly used commands and practices for SELinux system administration.

```
$ yum update
$ yum search selinux
$ sudo yum install policycoreutils policycoreutils-python setools setools-console setroubleshoot
```

OR

yum install selinux-policy-targeted
yum install selinux-policy-devel policycoreutils

vi /etc/selinux/config

- `policycoreuitls` and `policyoreutils-python` contain several management tools to administer your SELinux environment and policies.
-`setools` provides command line tools for working with SELinux policies. Some of these tools include, 
  - `sediff` which you can use to view differences between policies, 
  - `seinfo` a tool to view information about the components that make up SELinux policies, and 
  - `sesearch` used to search through your SELinux policies. 
setools-console consists of sediff, seinfo, and sesearch. You can issue the --help option after any of the listed tools in order to view more information about each one.
 
- setroubleshoot suite of tools help you determine why a script or file may be blocked by SELinux.
 Optionally, install setroubleshoot-server and mctrans. The setroubleshoot-server allows, among many other things, for email notifications to be sent from the server to notify you of any policy violations. The mctrans daemon translates SELinux’s output to human readable text

 File: /etc/selinux/config
 SELINUX=disabled
 SELINUXTYPE=targeted

 To disable SELinux, update your SELinux configuration file using the text editor of your choice. Set the SELINUX directive to disabled as shown in the example.


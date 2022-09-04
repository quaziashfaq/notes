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

Creating a _RAID 0_ device
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

Creating _xfs_ filesystem on top of `/dev/md0` and mounting it
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

$ sudo cryptsetup luksFormat /dev/vde
$ cryptsetup
$ sudo cryptsetup luksChangeKey /dev/vde
$ sudo cryptsetup open /dev/vde mysecuredisk
$ sudo mkfs.xfs /dev/mapper/mysecuredisk
$ sudo cryptsetup close myceruedisk




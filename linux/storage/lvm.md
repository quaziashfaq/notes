### Creating LVM from the scratch.

#### Find the added disk
I have added a 2G disk to my VM. I use the command `lsblk` to get the list of disks.
```
root@magpie:~# lsblk -a
NAME                  MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
loop0                   7:0    0        0 loop
loop1                   7:1    0        0 loop
loop2                   7:2    0        0 loop
loop3                   7:3    0        0 loop
loop4                   7:4    0        0 loop
loop5                   7:5    0        0 loop
loop6                   7:6    0        0 loop
loop7                   7:7    0        0 loop
sda                     8:0    0   10G  0 disk
├─sda1                  8:1    0  487M  0 part /boot
├─sda2                  8:2    0    1K  0 part
└─sda5                  8:5    0  9.5G  0 part
  ├─ubuntu--vg-root   253:0    0 10.5G  0 lvm  /
  └─ubuntu--vg-swap_1 253:1    0 1020M  0 lvm  [SWAP]
sdb                     8:16   0    2G  0 disk
└─sdb1                  8:17   0    2G  0 part
  └─ubuntu--vg-root   253:0    0 10.5G  0 lvm  /
sdc                     8:32   0    2G  0 disk
```
Here `sdc` is the new disk added. To create partition, then I use `parted` command.

#### Create partition with `parted` command
From this part, you need to be `root` user.
```
$ sudo su -
Password:
```

Run the `parted` command.

```
root@magpie:~# parted /dev/sdc
GNU Parted 3.2
Using /dev/sdc
Welcome to GNU Parted! Type 'help' to view a list of commands.
```

Enter `print` command inside `parted` environment.
```
(parted) print
Error: /dev/sdc: unrecognised disk label
Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sdc: 2147MB
Sector size (logical/physical): 512B/512B
Partition Table: unknown
Disk Flags:
```

Use `mklabel` to label the disk.
```
(parted) mklabel gpt
(parted) print
Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sdc: 2147MB
Sector size (logical/physical): 512B/512B
Partition Table: gpt
```

Then to create partition use `mkpart` command.
```
(parted) mkpart primary 1 -1
(parted) print
Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sdc: 2147MB
Sector size (logical/physical): 512B/512B
Partition Table: gpt
Disk Flags:

Number  Start   End     Size    File system  Name     Flags
 1      1049kB  2146MB  2145MB               primary
```

Then set the partition flag as `lvm`.
```
(parted) set 1 lvm on
(parted) print
Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sdc: 2147MB
Sector size (logical/physical): 512B/512B
Partition Table: gpt
Disk Flags:

Number  Start   End     Size    File system  Name     Flags
 1      1049kB  2146MB  2145MB               primary  lvm
```

#### LVM cretion

Create the **pv** first.
```
root@magpie:~# pvcreate /dev/sdc1
  Physical volume "/dev/sdc1" successfully created.
```

Then create a volume group (vg) named as _additionalvg_ on top of **/dev/sdc1**
```
root@magpie:~# vgcreate additionalvg /dev/sdc1
  Volume group "additionalvg" successfully created
```

Then create a logical volume (lv) with 1G size named as _lvol1_ out of the volume group _additionalvg_.
```
root@magpie:~# lvcreate --name lvol1 --size 1G additonalvg
  Logical volume "lvol1" created.
```

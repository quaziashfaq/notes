# How to create a RAID device

`sudo mdadm --create /dev/md0 --level=0 --raid-devices=3 /dev/vdc /dev/vdd /dev/vde`
`sudo mkfs.ext4 /dev/md0`
`sudo mdadm --stop /dev/md0`

Superblock has the data to recreate a raid volume out of the previous disks. To erase the superblock data:
`sudo mdadm --zero-superblock /dev/vdc /dev/vdd /dev/vde`


`sudo mdadm --create /dev/md0 --level=1 --raid-devices=2 /dev/vdc /dev/vdd --spare-devices=1 /dev/vde`

`cat /proc/mdstat`

`sudo mdadm --manage /dev/md0 --add /dev/vdf`

`sudo mdadm --manage /dev/md0 --remove /dev/vdf`

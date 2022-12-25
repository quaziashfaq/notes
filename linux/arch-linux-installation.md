# Plain Arch Linux Installation
HDD size 8 GB
Memory 2 GB
Installing in VMware Workstation 16.2

Create the VM in VMware workstation and set Firmware type as UEFI
Boot the system with Arch Linux CD.

Load the keyboard map. I prefer to use dvorak.
`# loadkeys dvorak`

To verify boot mode. It should not generate any error.
`# ls /sys/firmware/efi/efivars`

Check the link and connectivity
```
# ip link
# ip address
# ping -c 2 archlinux.org
```

Partition the disk into 4 sections with fdisk or cfdisk

| Partition # | Type | Mountpoint | FS type | Size   |
|-------------|------|------------|---------|--------|
| /dev/sda1   | EFI  | /efi       | FAT12   | 2MB    |
| /dev/sda2   | Boot | /boot      | Ext4    | 510MB  |
| /dev/sda3   | Swap |            | Swap    | 1 GB   |
| /dev/sda4   | Root | /          | Ext4    | 6.5 GB |

Format the Partitions:
```
# mkfs.fat -F 12 /dev/sda1
# mkfs.ext4 /dev/sda2
# mkswap /dev/sda3
# mkfs.ext4 /dev/sda4
```

Mount them now
```
# mount /dev/sda4 /mnt
# mount --mkdir /dev/sda1 /mnt/efi
# mount --mkdir /dev/sda2 /mnt/boot
# swapon /dev/sda3
```

Update the keyring and install the basic packages
```
# pacman -Sy archlinux-keyring
# pacstrap -K /mnt base linux linux-firmware vim sudo openssh grub lvm2 iproute2 efibootmgr
```

Create the Fstab and chroot into /mnt
```
# genfstab -U /mnt >> /mnt/etc/fstab
# arch-chroot /mnt
```


Set the clock
```
# ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
#  hwclock --systohc
```

Edit /etc/locale.gen and uncomment en_US.UTF-8 UTF-8
```
# locale-gen
# echo "LANG=en_US.UTF-8" >> /etc/locale.conf
# echo "KEYMAP=de-latin1" >> /etc/vconsole.conf
# echo "put-your-host-name" > /etc/hostname
```

If there is not changes to be done to `HOOKS` in `/etc/mkinitcpio.conf`, then just run the following
```
# mkinitcpio -P
```


To set root user's password
`# passwd`

Install boot-loader
```
# grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=grub
# grub-mkconfig -o /boot/grub/grub.cfg
```


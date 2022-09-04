# Setting Autoshare

## Install and configure nfs-server
Install NFS at first and start the nfs-server
```
$ sudo dnf install nfs-utils
$ sudo systemctl enable nfs-server
$ sudo sytemctl start nfs-server
```

Edit the `/etc/exports` file
```
$ vim /etc/exports
/etc 127.0.0.1(ro)

```
Close the file and reload the NFS server.

`$ sudo systemctl reload nfs-server`



## Install and configure autofs in client
```
$ sudo dnf install autofs
$ sudo systemctl enable autofs
$ sudo systemctl start autofs
```

Edit /etc/auto.master file. Add a line which states parent folder of all the remote mountpoints and configuration file for the parent folder.

`$ echo '/shares /etc/auto.shares --timeout=400' >> /etc/auto.master`

Then list down the mountpoint name and remote shares in `/etc/auto.shares`file.

`$ echo 'mynetworkshare -fstype=auto 127.0.0.1:/etc' >> /etc/auto.shares`

Then reload the autofs
`$ sudo systemctl reload autofs`


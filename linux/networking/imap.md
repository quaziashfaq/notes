
```
$ dnf install dovecot
$ systemctl start dovecot
$ systemctl enable dovecot

$ firewall-cmd --zone=public --add-service=imap
$ firewall-cmd --zone=public --add-service=imaps
$ firewall-cmd --runtime-to-permanent
```

The configuration file
```
$ vim /etc/dovecot/dovecot.conf
```

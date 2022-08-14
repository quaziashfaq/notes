# Setting Timezone and NTP


To set timezone
```
$ timedatectl list-timezones
$ timedatectl set-timezone Asia/Singapore
```

To install and configure the ntp-client in RedHat
```
$ sudo dnf install chronyd
$ sudo systemctl start chronyd.service
$ sudo systemctl enable chronyd.service
$ sudo timedatectl set-ntp true
```





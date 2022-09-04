# Network Interface Setting

ip link
ip addr show

A sample NIC configuration in RedHat

```
$ cat /etc/sysconfig/netowrk-scripts/ifcfg-enp0s3
TYPE=Ethernet
PROXY_METHOD=no
BOOTPROTO=dhcp or none
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6INIT=yes
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no
NAME=enp0s3
UUID=
DEVICE=enp0s3
ONBOOT=yes
```

`NetworkManager` service manages the NIC cards.
The commands to interact with it are `nmtui` and `nmcli`

To check the IP, routing or services
```
$ ip link show
$ ip addresses show
$ ip route show
$ ss -ltunp
```


# Test
  Testing

## Test level 2
   I am testing this. Let's see how it works.
   I am testing this. Let's see how it works.
   I am testing this. Let's see how it works.
   I am testing this. Let's see how it works.


Now testing other lines

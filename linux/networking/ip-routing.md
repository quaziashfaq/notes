# Configuring IP Rouing

# IP ROUTE

To temporarily add ip routing info
`$ sudo ip route add 192.168.0.0/24 via 10.0.0.100`


`$ nmcli connection show`

To add routing with `nmcli` command
```
$ sudo nmcli connection modify enp0s3 +ipv4.route "192.168.0.0/24 10.0.0.100"
$ sudo nmcli device reapply enp0s3
$ ip route show
```


To remove routing with `nmcli` command
```
$ sudo nmcli connection modify enp0s3 -ipv4.route "192.168.0.0/24 10.0.0.100"
$ sudo nmcli device reapply enp0s3
$ ip route show
```



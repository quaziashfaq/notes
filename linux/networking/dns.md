# DNS or Domain Name System

Caching DNS server

DNS server solution

Install bind
`$ sudo dnf install bind bind-utils`

Check the manual page
`$ man named.conf`

```
$ sudo vim /etc/named.conf
listen-on port 53 {127.0.0.1;};
listen-on port 53 {127.0.0.1; 192.168.0.17;};
```
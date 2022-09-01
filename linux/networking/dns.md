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
listen-on port 53 {any};


allow-query {localhost;};
allow-query {localhost; 192.168.0.0/24};
allow-query {any;};

recursion yes;
```

```
$ sudo systemctl enable named.service
$ sudo systemctl start named.service

$ sudo firewall-cmd --add-service=dns
$ sudo firewall-cmd --runtime-to-permanent
```

Query your DNS server
`$ dig @127.0.0.1 google.com`
`$ dig @localhost google.com`

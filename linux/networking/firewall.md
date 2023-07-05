# IPTABLES

Command to check the iptables
```
$ iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination    
```


Command to allow access to port 22
```
$ iptables -A INPUT -p tcp -s <src> --dport 22 -j ACCEPT
$ iptables -L
```

$ iptables -A INPUT --dport 22 -j DROP


# FIREWALLD

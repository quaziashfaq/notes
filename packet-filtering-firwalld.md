# Packet Filtering with Firewalld

## Packet Filtering
Firewalld service filters packets as defined in different zones.

To get the default zone
`$ firewall-cmd --get-default-zone`

To set the default zone
`$ firewall-cmd --set-default-zone=public`

To list the default zone
`$ sudo firewall-cmd --list-all`

To list all the zones
`$ sudo firewall-cmd --list-all-zones`

To check the ports related to service
`$ sudo firewall-cmd --info-service=cockpit`

To add/allow a service in the firewalld
`$ sudo firewall-cmd --add-service=http`
`$ sudo firewall-cmd --add-port=80/tcp`

`$ sudo firewall-cmd --list-all`

`$ sudo firewall-cmd --remove-service=http`

To get the active zones
`$ sudo firewall-cmd --get-active-zones`

To make the newly added/deleted rules permanent
`$ sudo firewall-cmd --runtime-to-permanent`

To add to permanent rule
`$ sudo firewall-cmd --permanent --zone=public --add-port=12345/tcp`



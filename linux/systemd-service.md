[Up](./readme.md)

# Introduction to systemd

Couple of things are required to for configuring a service.
- a program (/usr/bin/project-mercury.sh)
- start a python app after postgresql is running
- use service account
- auto restart or failure
- restart interval 10 seconds
- log service events
- load when booting into graphical mode

Create a service definition file
/etc/systemd/system/project-mercury.service

```
[Unit]
Description=Python Django for Project Mercury
Documentaton=http://wiki/mercury
After=postgresql.service

[Service]
ExectStart=/bin/bash /usr/bin/project-mercury.sh
User=project-mercury
Restart=on-failure
RestartSec=10

[Install]
WantedBy graphical.target
```

To detect the changes in the systemd file, run the below
`$ systemctl daemon-reload`

Then start the service
`$ systemctl start projec-mercury.service

To reload a service configuration without changing the running process.
`$ systemctl reload project-mercury.service`

To reload the system aware of the changes in the configuration in the running service
`$ systemctl daemon-reload`

To edit the systemd config file:
`$ systemctl edit project-mercury.service --full`

systemctl get-default
systemctl set-defualt

systemctl list-units --all
systemctl list-units

journalctl 
journalctl -b <- for current boot env
journalctl -u UNIT


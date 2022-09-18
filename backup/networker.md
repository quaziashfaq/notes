
# NetWorker Components
  - NetWorker Server
  - Storage Node
  - NetWorker Client
  - Backup Storage Device
  - Management Console Server
  - Management Console Client

# NetWorker Processes
  - Master Server
    - **nsrd**
      - Master Daemon
      - Manages the Networker resurce database, which contains all NetWorker configuratino info.
      - It manages the schedule.
    - **nsrmmdbd**
      - Reads from and Writes to media database.
    - **nsrindexd**
      - Reads from and Writes to client file index databases
    - **nsrjobd**
      - nsrd asks this process to request nsrexecd (client process) to run backup job.
      - It passes all jobs info to nsrd for reporting purpose
    - **nsrmmgd**
      - Manages all library operations.
      - Started by nsrd

  - Storage Node - Which controls the storage devices
    - **nsrsnmd**
      - Each storage node has one nsrnmd process.
      - Manages the storage devices and nsrmmd processes.

    - **nsrmmd** (Networker Save and Recovery Media Multiplexing Daemon)
      - One nsrmmd process for each device configured Network resource.
      - Receives backup data from client
      - Reads from and writes to NetWorker backup devices
      - Organizes backup data
      - Tracks and send tracking data to media database

    - **nsrlcpd** (NetWorker Save and Recover Library Control Daemon)
      - Controls library resources.

      
  - Client
    - **nsrexecd**
      - listens for, authenticates, supports remote execution requests from Networker server
      - Determines which RPC ports to use when executing backup/restore/communication.

  - NetWorker Console Server Process
    - **httpd**   : Embedded Apache httpd server
    - **gstd**    : Master console proces
    - **postgres**: Used for reporting purpose. 


# Backup Flow
  1. Master server starts the backup job
      nsrd -> nsrjobd -> nsrexecd -> save
  2. Client process asks master server to support backup
      save -> nsrjobd -> nsrd
  3. Master server talks storage node to support backup. Storage Node communicates to media multiplexing daemon.
      nsrd -> nsrsnmd -> nsrmmd
  4. Master server shares storage node and storage media manager info to client process.
      nsrd -> nsrjobd -> nsrexecd -> save
  5.a. Client backup process sends the backed up files metadata for indexing
        save -> nsrindexd
    b. Client sends data to media manager
        save -> nsrmmd
  6.a. Media Manager sends data to volume (the backup storage)
        nsrmmd -> Volume
    b. Media manager also sends metadata to media manager database.
        nsrmmd -> nsrmmdbd
  


# NetWorker Basics
## NetWorker Concepts
  
# NetWorker Planning and Installation
# Media Tracking and Management
# Performing Backups
# Configuring and Managing Devices
# NetWorker Database Management
# Performing NetWorker Recoveries
# Performing Cloning and Staging
# NetWorker Security
# Administering NetWorker
# Recovering Windows Hosts and Cluster Environments
# Recovering NetWorker and NMC Servers


# Commands

To get tape label and mount info.
```
$ mminfo -q "family=tape" -r "volume,olabel(25),labeled(25),mounts,recycled"
$ mminfo -q "family=tape" -r "volume,olabel(25),labeled(25),mounts,recycled" -xc,
```

To get saveset record
`$ mminfo -a | more`

To get volume record
`$ mminfo -m`


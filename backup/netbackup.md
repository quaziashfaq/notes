# Concepts

## Master Server
Master server manages backups, archives, and restores.

Master server contains the catalog. The catalog contains the internal database that has information about Netbackup backups and configuration.

Master server is responsible for media and device selection.

## Media Server
Media servers provide additional storage by allowing Netbackup to use attached storage devices.

Media servers are also referred to as:
 - Device Hosts (when tape devices are present)
 - Storage Servers (when I/O is directly to disk)
 - Data movers (when data is sent to independent, external disk devices like OpenStorage appliances.)


## Policies
Policies are the rules that the master server follows
 - They say when backups occur.
   Schedules for automatic and unattended client backups.
 - Whether the users can manually take their own backup.
 - When you can manually take backup and restore.
 - The administrator can define any number of backup policies, each of which can apply to one or more clients. A NetBackup client must belong to at least one backup policy to be backed up.




## Storage
Storage
 - Storage units
 - Storage unit groups
 - Storage lifecycle policies (SLPs)
 - windows for secondary operations in SLPs


## Catalog
Use to create and configure a catalog backup, which is a special type of backup that NetBackup requires for its
own internal databases.
These databases, called the NetBackup catalog, are located on the NetBackup master and media server. The
catalog contains information on every client backup. Catalog backups are tracked separately from other backups
to ensure recovery in case of a server crash.
The Catalog utility is also used for the following actions:
 - To duplicate a backup image
 - To promote a backup image from a copy to the primary backup copy
 - To manually expire backup images
 - To import expired backup images or images from another NetBackup server
 - To search for a backup image to verify the contents of the media with what is recorded in the NetBackup catalog


## SLP Windows ?? WHAT THE HELL IS IT?
SLP Windows contains any schedules that are defined for secondary operations in a storage lifecycle policy.
A window can better define when the job for a secondary operation can run, making sure that the job does not
interfere with jobs of a higher priority.


# Book names:
Restore operation
Book name: Nebcakup Backup, Archive, and Restore Getting Started

Policy creation / Netbackup Administration
Netbackup Administrator's Guide for UNIX, Windows, Linux vol 1

# Misc
* Learn Extra
** Security Certificates
Certificate Hash
Root Certificate Authority fingerprint


# Learning from sites
Nbemm don't start
Solved Go to solution
Ivan_Niagara
 Level 3
Ivan_Niagara





$ ./netbackup/bin/admincmd/bpgetconfig -g node-2 -L

Client/Master = Master
NetBackup Client Platform = RS6000, AIX5
NetBackup Client Protocol Level = 6.0.0.0.4.4
Product = NetBackup
Version Name = 6.0
Version Number = 600000
NetBackup Installation Path = /usr/openv/netbackup/bin
Client OS/Release = AIX 5.3



# cat -s ./netbackup/bin/version

NetBackup-AIX5 6.0MP5



Hostname: node-2



File /etc/hosts:



127.0.0.1               loopback localhost

192.168.2.1     node-1m

10.208.2.201    node-1  node-1.test.ts

192.168.2.6     node-2m

10.208.2.202    node-2  node-2.test.ts



10.208.2.205    clora

10.208.2.203    clapp



Local IP:



en1:

        inet 10.208.2.202 netmask 0xffff0000 broadcast 10.208.255.255

        inet 10.208.2.203 netmask 0xffffff00 broadcast 10.208.2.255



en3:

        inet 192.168.2.6 netmask 0xffffff00 broadcast 192.168.2.255



lo0:

        inet 127.0.0.1 netmask 0xff000000 broadcast 127.255.255.255



******************************** End environment ***********************



When I starting command

/usr/openv/netbackup/bin/nbemm

I have this on log file :



1,51216,111,111,25,1337191197619,884866,1,0:,0:,33:ConnectionManager:Smiley SurprisedpenConnection,1,(1049|A122:Can't connect to the database ([Sybase][ODBC Driver][Adaptive Server Anywhere]Request to start/stop database denied <-1> )|)

1,51216,111,111,26,1337191198627,884866,1,0:,0:,14:EMMServer::run,1,(1051|)

1,51216,111,111,27,1337191198628,884866,1,0:,0:,14:EMMServer::run,1,(1049|A39:Can not establish initial DB connection|)

0,51216,137,111,56,1337191198628,884866,1,0:,56:shutting down the service: block = 0(OrbService.cpp:421),16Smiley SurprisedrbService::stop,1

0,51216,137,111,57,1337191198651,884866,1,0:,77:=========================================================(OrbService.cpp:440),16Smiley SurprisedrbService::stop,1

0,51216,137,111,58,1337191198651,884866,1,0:,57:                 Service Going Down! (OrbService.cpp:441),16Smiley SurprisedrbService::stop,1

0,51216,137,111,59,1337191198651,884866,1,0:,77:=========================================================(OrbService.cpp:442),16Smiley SurprisedrbService::stop,1

0,51216,111,111,28,1337191198652,884866,1,0:,24:EMM Server shutting down,15:EMMServer::fini,1

2,51216,111,111,29,1337191198652,884866,1,0:,0:,0:,0,(1003|A15:EMMServer::fini|)

1,51216,111,111,30,1337191198652,884866,1,0:,0:,15:EMMServer::fini,1,(1049|A49:Exception caught for IORTable clean up <NotFound>|)

0,51216,111,111,31,1337191198652,884866,1,0:,29:EMM Server shut down complete,15:EMMServer::fini,1



Is there a solution to this problem?

Thanks

7.1.x and Earlier  Backup and Recovery  NetBackup
1 Solution
 mph999
 Level 6
mph999
EMPLOYEE ACCREDITED
‎05-15-2012 11:21 PM
Database is probably down.

Run ...

/usr/openv/db/bin/nbdb_ping

You should see a message like this ...

Database [NBDB] is alive and well on server [NB_womble].

If not, then check for full file systems.  Then try this :

Follow these steps exactly ...





/usr/openv/netbackup/bin/goodies/netbackup stop

/usr/openv/db/bin/nbdb_admin -auto_start NONE

. /usr/openv/db/vxdbms_env.sh

cd /usr/openv/db/data

mv NBDB.log NBDB.log.bad

/usr/openv/db/bin/dbeng9 -f NBDB  (use dbeng11 if NBU 7)

/usr/openv/db/bin/nbdb_admin -auto_start NBDB

( /usr/openv/db/bin/nbdb_admin -auto_start BMRDB  -  If using BMR)



/usr/openv/db/bin/nbdbms_start_server

/usr/openv/db/bin/nbdb_ping



Martin
** nbemm command from Veritas NetBackup Command Reference Guide
Name
nbemm — run the NetBackup EMM daemon to manage volumes, volume pools, barcode rules, and devices

SYNOPSIS
nbemm [-console] [-terminate]


On UNIX systems, the directory path to this command is /usr/openv/netbackup/bin/

On Windows systems, the directory path to this command is install_path\NetBackup\bin\

DESCRIPTION
The Enterprise Media Manager daemon or service manages volumes, volume pools, barcode rules, and devices. This daemon performs media, drive, drive path, and storage unit selection.

Note:

The nbemm daemon or service must be active to change the volume configuration, device configuration, storage unit configuration, and for any tape mount activity.

To start nbemm, enter nbemm.

To stop nbemm, enter nbemm -terminate.

OPTIONS
-console
This option enables you to start NetBackup in console mode.

-terminate
This option enables you to stop the nbemm binary.

SEE ALSO
See nbemmcmd.
** How to monitor and restart the Veritas Private Branch Exchange process
Article: 100017236
Last Published: 2010-01-08
Ratings:  12 1
Product(s): NetBackup
Description

What is PBX?
The Veritas Private Branch Exchange (PBX) software is part of the Infrastructure Core Services.  This service provides single port access to clients outside the firewall connecting to various services running as part of NetBackup or OpsCenter.


Stopping PBX
Stop NetBackup before restarting the PBX process. Stopping PBX will interrupt communication between NetBackup processes and clients until PBX is restarted.  If processes are actively using PBX, unpredictable behavior maybe the result if PBX is restarted. For example, stopping PBX while there are active or queued NetBackup jobs will cause backups to fail with a Status 12 (file open failed), a Status 25 (cannot connect on socket),  or a Status 50 (client process aborted), as well as other possible errors.



Restarting PBX (Windows)
For Windows systems,  the Services tool can be used to view the status of the PBX service.  It can also be used to stop, start, or restart the service.

Right Click on My Computer and select Manage to open the Computer Management tool
Select Services under the Services and Applications section to display a list of services
Scroll down the list of services to display Veritas Private Branch Exchange
The Status column will display if the service is started
To stop, start, or restart the service, right click on Veritas Private Branch Exchange and select Stop, Start or Restart from the menu


Restarting PBX (Unix)
For UNIX systems use the ps -ef | grep pbx command to determine if the pbx_exchange process is running.  On NetBackup servers the bpps -x command can also be used to verify if PBX is running.  The "-x" switch is new in NetBackup 6.0 and will display Veritas Shared Processes such as pbx_exchange.

The following example is from a Solaris 9 server running NetBackup 6.0:

# /usr/openv/netbackup/bin/bpps -x
...
SharedVERITASProcesses
------------------------
 root  827  1  0  Sep23 ?  1:26 /opt/VRTSpbx/bin/pbx_exchange

To stop the pbx_exchange daemon:
#/opt/VRTSpbx/bin/vxpbx_exchanged stop

To start the pbx_exchange daemon:
#/opt/VRTSpbx/bin/vxpbx_exchanged start
** Media Server De-duplication Pool (MSDP) comes online after long time.
After Startup of NetBackup on a server with Media Server De-Duplication Pool (MSDP) configured the PureDisk Volume will be down until spoold's Connection Manager has completed it's startup - this can take an extended amount of…

Article: 100002068
Last Published: 2010-01-11
Ratings:  3 1
Product(s): NetBackup
Problem
After Startup of NetBackup on a server with Media Server De-Duplication Pool (MSDP) configured the PureDisk Volume will be down until spoold's Connection Manager has completed it's startup - this can take an extended amount of time.
Solution
On Startup theinternal MSDP spoold daemon has to perform a number of initialization functionsand until these are completed the Pool will not respond to queries fromNetBackup and the PureDisk volume will remain down.
As a resultNetBackup will not be able to direct any backups this Disk Pool. Once the starthas completed the Pool will automatically become available for backups. The DiskVolume will show as down when queried:
#/usr/openv/netbackup/bin/admincmd/nbdevquery -listdv -stypePureDisk
-U
DiskPool Name      : dedup_pool
DiskType           : PureDisk
DiskVolume Name    : PureDiskVolume
DiskMedia ID       : @aaaae
TotalCapacity (GB) : 24414.06
FreeSpace (GB)     : 8562.09
Use%                :64
Status              :DOWN
Flag                :ReadOnWrite
Flag                :AdminUp
Flag                :InternalDown

Attemptsto change the state of the PureDiskVolume to UP will report assuccessful:
#/usr/openv/netbackup/bin/admincmd/nbdevconfig -changestate -stype PureDisk -dpdedup_pool -dv PureDiskVolume -state UP
successfullychanged the state of disk volume

but the volumewill still be down if queried again:
#/usr/openv/netbackup/bin/admincmd/nbdevquery -listdv -stype PureDisk -U
DiskPool Name      : dedup_pool
DiskType           : PureDisk
DiskVolume Name    : PureDiskVolume
DiskMedia ID       : @aaaae
TotalCapacity (GB) : 24414.06
FreeSpace (GB)     : 8562.09
Use%                :64
Status              :DOWN
Flag                :ReadOnWrite
Flag                :AdminUp
Flag                :InternalDown

Above exampleis from a Linux system - Windows command is located in"<INSTALL_PATH>\VERITAS\NetBackup\bin\admincmd".

To determine ifthe startup has completed review the<STORAGE_LOCATION>/log/spoold/spoold.log file. Until the ConnectionManager has started the daemon will not respond. This is reported in the logfile at the default log level as:
June10 06:17:48 INFO [47732887389760]: Connection Manager:started

The value of<STORAGE_LOCATION> in the above path can be determined with the followingcommands.
UNIX:
/usr/openv/netbackup/bin/admincmd/nbdevquery-listconfig -stype PureDisk -storage_server STORAGE_SERVER_NAME-U
WINDOWS:
<INSTALL_PATH>\VERITAS\NetBackup\bin\admincmd\nbdevquery-listconfig -stype PureDisk -storage_server STORAGE_SERVER_NAME-U
replaceSTORAGE_SERVER_NAME with the name of the storage server (normally the systemname of the media server.

Normally thisis quickly reached after the startup of the process but if for example there are a large number transaction logs (tlogs) outstanding this can take an extended length of time. For example below the Disk Pool was unavailable for over an hourafter a restart of NetBackup on the media server:
June10 05:00:23 INFO [ 47732887389760 ]:Connection Manager: initializing
June10 05:00:23 INFO [ 47732887389760 ]:Connection Manager: initialization complete
June10 06:17:48 INFO [ 47732887389760 ]:Connection Manager: started
** A PureDisk (PDDO) or MSDP disk pool is in a "DOWN" (InternalDown) state causing backups to fail with a status code 213.
Article: 100006075
Last Published: 2011-08-25
Ratings:  2 3
Product(s): NetBackup
Problem
A PureDisk (PDDO) or a MSDP disk pool is constantly displaying that it is in a "DOWN" state.  When executing an `nbdevquery` command, we can confirm the state of the disk volume in question.  After trying to change the state of the disk pool to UP, the disk pool remains DOWN.

Command to change the state of the disk pool to "UP":

# nbdevconfig -changestate -stype PureDisk -dp Disk_Pool_name -state UP
Even when attempting to reset the disk pool, it makes no difference - the disk pool remains in a DOWN state.

Command to "Reset" a disk pool:

# nbdevconfig -changestate -stype PureDisk -dp Disk_Pool_name -state RESET


Error Message
Example of output:

# nbdevquery -listdv -stype PureDisk -U


Disk Pool Name      : Disk_Pool_Name
Disk Type           : PureDisk
Disk Volume Name    : PureDiskVolume
Disk Media ID       : @aaaas
Total Capacity (GB) : 11612.91
Free Space (GB)     : 2660.58
Use%                : 77
Status              : DOWN
Flag                : ReadOnWrite
Flag                : AdminUp
Flag                : InternalDown
Num Read Mounts     : 0
Num Write Mounts    : 1
Cur Read Streams    : 0
Cur Write Streams   : 0

Cause
Possible missing or corrupted ost-plugin configuration file on the media server.

Solution
Verify the existance of the ost-plugin config file on the media server.

Unix:

/usr/openv/lib/ost-plugins/svrname.cfg

Windows:

<Install_path>\NetBackup\bin\ost-plugins\srvrname.cfg
If this file is missing or corrupted (perhaps 0 byte size), you will need to copy this configuration file from another media server and edit the file to meet this specific media server's information.  Another option (if it exists) is to restore the configuration file from a previous backup of this media server.  Once the file is in place, please restart NetBackup daemons/services.  The disk pool will go into an "UP" state; backups will complete without a status code 213.
** Windows MSDP Disk pool is down, backups and duplications failing with status 213, no storage units available for use
Article: 100024315
Last Published: 2013-05-06
Ratings:  0 1
Product(s): NetBackup
Problem
Backups, restores and duplications failing with status 213 when accessing a media server deduplication storage server.

Error Message
Status Code: 213 - no storage units available for use

Cause
Disk pool is down
The NetBackup MSDP media server is so busy that that the disk pool gets marked as down.
The NetBackup services are not running on the media server with MSDP configured (spoold.exe, spad.exe, postgreSQL)
The NetBackup deduplication engine (spoold.exe) is running but has stopped responding
The NetBackup Deduplication Manager (spad.exe) is running but has stopped responding
The database processes (postgres) is not running
Queue processing is not able to run due to issues in the <MSDP install path\queue folder (transaction logs, sorted.delayed or other .delayed files)
Patch version of the NetBackup binaries on the MSDP media server
Solution
To trouble shoot the above possible causes:

1. Disk pool is down.

Try to put the disk pool up from the GUI.

If there is an error, record the error and search for possible causes of that error.
If the disk pool does not change to an UP state, try bringing up the disk pool using command line.

<NBU install path>\NetBackup\bin\admincmd\nbdevconfig -changestate -stype PureDisk -dp <disk pool name> -state UP
2. The MSDP media server is so busy that the disk pool gets marked as down.

Check to see if the status 213 is happening only at certain  high volume times.  If yes, create these files on the MSDP media server using the steps in 000012819 to adjust the DPS polling interval time.

DPS_PROXYDEFAULTSENDTMO (value of 1800 inside)
DPS_PROXYDEFAULTRECVTMO (value of 1800 inside)

Warning: if the issue persists after one daily or nightly backup schedule window after employing the above configuration changes, please remove the touchfiles and troubleshoot the issue further via logs (nbrmms, dps, spoold, spad) to determine root cause.

3. Check the services on the MSDP media server.

Verify that these are running.

spoold.exe
spad.exe
postgreSQL
If they are not running, start them.  If they do not start, and there is an error, record the error and search to determine what is the usual cause for the error.

Additional information about why a services is not starting is located in these log folders on the MSDP server.

<MSDP install path\log\spoold\spoold.log
<MSDP install path\log\spad\spad.log
<MSDP install path\log\spoold\storaged.log
4. The NetBackup deduplication engine (spoold.exe) is running but has stopped responding.

Check the <MSDP install path\log\spoold\storaged.log to see if the queue processing stopped on a particular transaction log.  Look for messages like this:

WARNING [xxxx]: 25000: Transaction log <install path>\queue\sorted-xxxxxxx-yyyyyyy.tlog failed: Could not process tlog entries: zero-sized object
Transaction will be retried.
ERR [xxxx]: 25004: Queue processing failed five times in a row. Queue processing will be disabled and the CR will no longer accept new backup data. Content router has been totally shut down.
Check to see if the last line in the storaged.log file contains a string similar to this.

sorted-123456-789101.delayed

If yes, check the <msdp install path>\queue folder to see what is the date and time associated with that file, if it exists.

Stop and restart the NetBackup services to see if that allows the MSDP pool to come back to an UP status.

5. The NetBackup Deduplication Manager (spad.exe) is running but has stopped responding.

Check the <MSDP install path\log\spad\spad.log file for errors.
Run this command to see what spad.exe may be doing.
<NBU install path>\veritas\pdde\spad.exe  --trace -v If this error is returned,
Error: 25053: Could not establish a connection to 127.0.0.1:10102: connect failed (No connection could be made because the target machine actively refused it.)
7.1 and earlier, see troubleshooting steps in article 000012709.

Stop and restart the NetBackup services to see if that allows the MSDP pool to come back to an UP status.

6. The database processes (postgres) is not running

Try to restart the postgresql service.  If there is an error, and it won't start:

Check to make sure the user running postgresSQL has permissions to the MSDP install folder.
Disable any any internal firewall that may be running.
Look at Windows Event viewer, Application Log for indications of why it won't start.
It is possible the user running the postgresql service does not have permission to access <msdp install path>\databases\pddb\data folder.

Amend the security policy to allow the purediskdbuser account to have the "log on as a service" right.
Change the postgresql-8.3 service manually to a new domain account or to any other account that can run the services.
Change the postgresql-8.3 service to run as Local System.
Note: If the 2nd or 3rd solution is being implemented, then the account from step 2 and the SYSTEM account both need to be granted full NTFS permissions to the <msdp install path>\databases\pddb\data folder.

7. Queue processing is not able to run due to issues in the <MSDP install path\queue folder (transaction logs, sorted.delayed or other .delayed files)

Review these log files from the MSDP media server.
<MSDP install path\log\spoold\spoold.log
<MSDP install path\log\spoold\storaged.log

Check to see how many files exist in the <MSDP install path\queue folder, what is the time stamp on the oldest and newest file in that folder.  If queue processing is run, does that information change?
8. Patch version of the NetBackup binaries on the MSDP media server.

If the NetBackup MSDP media server is running NetBackup 7.01, make sure the engineering binary bundle Rocksolid version 7 is installed.  If not, install it.

rocksolid EEB 2233961EEB 7
See article https://www.veritas.com/docs/000011884

Helpful log files to enable on the NetBackup media server with MSDP configured

<MSDP install path\log\spad\spad.log
<MSDP install path\log\spoold\spoold.log
<MSDP install path\log\spoold\storaged.log
Enable logging level 5 using NetBackup GUI for bptm on the MSDP server and create this folder.

<NetBackup install path>\NetBackup\logs\bptm
Windows Event viewer, Application Log and System log. Look for errors or warnings reported for spood, spad, service control manager, or any other NetBackup service reporting an error.

Edit the <MSDP install path>\etc\spa.cfg file so that the line Logging=long,thread reads:
Logging=full,thread

Edit the <NBU install path>\NetBackup\bin\ost-plugins\pd.conf file so that these two lines are uncommented:

DEBUGLOG = <some_dir_path_with_space> pdplugin.log
LOGLEVEL = 10

When the error happens again, gather these and review.

<NBU install path>\NetBackup\logs\bptm\log.mmddyy

<MSDP install path\log\spad\spad.log
<MSDP install path\log\spoold\spoold.log
<MSDP install path\log\spoold\storaged.log

pdplugin.log (location listed in pd.conf file)

Event Viewer, Application log and System Log.


Applies To

NetBackup 7.01 master server
NetBackup 7.01 Windows media server with NetBackup Deduplication Storage server configured.

The same investigations below can be used on a UNIX MSDP storage server.  This article is specific to windows syntax.  For more UNIX syntax, see article 000082056.
** UNIX or Linux MSDP Disk pool is down, backups and duplications failing with status 213, no storage units available for use
Article: 100024420
Last Published: 2013-05-06
Ratings:  0 0
Product(s): NetBackup
Problem
Backups, restores and duplications failing with status 213 when accessing a media server deduplication storage server.

Error Message
Status Code: 213 - no storage units available for use

Cause
Disk pool is down
The NetBackup MSDP media server is so busy that that the disk pool gets marked as down.
The NetBackup services are not running on the media server with MSDP configured (spoold spad)
Queue processing is not able to run due to issues in the <MSDP install path\queue folder (transaction logs, sorted.delayed or other .delayed files)
Patch version of the NetBackup binaries on the MSDP media server
Solution
To trouble shoot the above possible causes:

1. Disk pool is down.

Try to put the disk pool up from the GUI.

If there is an error, record the error and search for possible causes of that error.
If the disk pool does not change to an UP state, try bringing up the disk pool using command line.

/usr/openv/NetBackup/bin/admincmd/nbdevconfig -changestate -stype PureDisk -dp <disk pool name> -state UP

2. Check to see if the status 213 is happening only at certain  high volume times.  If yes, create these files on the MSDP media server using the steps in 000012819 to adjust the DPS polling interval time.

DPS_PROXYDEFAULTSENDTMO (value of 1800 inside)
DPS_PROXYDEFAULTRECVTMO (value of 1800 inside)

Warning: if the issue persists after one daily or nightly backup schedule window after employing the above configuration changes, please remove the touchfiles and troubleshoot the issue further via logs (nbrmms, dps, spoold, spad) to determine root cause.

3. Check the services on the MSDP media server.  Verify that these are running.

spoold
spad


If they are not running, start them.  If they do not start, and there is an error, record the error and search to determine what is the usual cause for the error.

Additional information about why a services is not starting is located in these log folders on the MSDP server.

/MSDP install path/log/spoold/spoold.log
/MSDP install path/log/spad/spad.log
/MSDP install path/log/spoold/storaged.log

4. The NetBackup deduplication engine (spoold.exe) is running but has stopped responding.

Check the /MSDP install path/log/spoold/storaged.log to see if the queue processing stopped on a particular transaction log.  Look for messages like this:

WARNING [xxxx]: 25000: Transaction log /MSDP install path/queue/sorted-xxxxxxx-yyyyyyy.tlog failed: Could not process tlog entries: zero-sized object
Transaction will be retried.
ERR [xxxx]: 25004: Queue processing failed five times in a row. Queue processing will be disabled and the CR will no longer accept new backup data. Content router has been totally shut down.

Check to see if the last line in the storaged.log file contains a string similar to this.

sorted-123456-789101.delayed

If yes, check the <msdp install path>/queue folder to see what is the date and time associated with that file, if it exists.

Stop and restart the NetBackup services to see if that allows the MSDP pool to come back to an UP status.

See troubleshooting steps in article 000012709.

Stop and restart the NetBackup services to see if that allows the MSDP pool to come back to an UP status.

Disable any any internal firewall that may be running.

Look at Windows Event viewer, Application Log for indications of why it won't start.
It is possible the user running the postgresql service does not have permission to access /msdp install path/databases/pddb/data folder.

7. Queue processing is not able to run due to issues in the <MSDP install path\queue folder (transaction logs, sorted.delayed or other .delayed files)

Review these log files from the MSDP media server.
/MSDP install path/log/spoold/spoold.log
/MSDP install path/log/spoold/storaged.log

Check to see how many files exist in the /MSDP install path/queue folder, what is the time stamp on the oldest and newest file in that folder.  If queue processing is run, does that information change?
8. Patch version of the NetBackup binaries on the MSDP media server.

If the NetBackup MSDP media server is running NetBackup 7.01, make sure the engineering binary bundle Rocksolid version 7 is installed.  If not, install it.

rocksolid EEB 2233961EEB 7
See article 000011884.

Helpful log files to enable on the NetBackup media server with MSDP configured

/MSDP install path/log/spad/spad.log
/MSDP install path/log/spoold/spoold.log
/MSDP install path/log/spoold/storaged.log

Enable logging level 5 using NetBackup GUI for bptm on the MSDP server and create this folder.

/usr/openv/netbackup\logs\bptm

Windows Event viewer, Application Log and System log. Look for errors or warnings reported for spood, spad, service control manager, or any other NetBackup service reporting an error.

Edit the /MSDP install path/etc/spa.cfg file so that the line Logging=long,thread reads:
Logging=full,thread

Edit the /usr/openv/lib/ost-plugins/pd.conf file so that these 2 lines are uncommented:

DEBUGLOG = <some_dir_path_with_space> pdplugin.log
LOGLEVEL = 10

When the error happens again, gather these and review.

/MSDP install path/log/spad/spad.log
/MSDP install path/log/spoold/spoold.log
/MSDP install path/log/spoold/storaged.log

<install path>\NetBackup\logs\bptm

pdplugin.log (location listed in bp.conf file)

/var/adm/messages/

/var/log/messages

/var/log/syslog


Applies To

NetBackup 7.01 master server
NetBackup 7.01 UNIX or Linux media server with NetBackup Deduplication Storage server configured.

Related Knowledge Base Articles
Windows MSDP Disk pool is down, backups and duplications failing with status 213, no storage units available for use
Was this content helpful?

VOX Community Veritas.com
Visit our social dashboard
Privacy Policy Legal User agreement

** Disk storage server is down(2106)
Article: 100008864
Last Published: 2013-09-11
Ratings:  2 9
Product(s): NetBackup
Problem
All backups to the Windows MSDP media server are failing with "NBU status: 2106, EMM status: Storage Server is down or unavailable"

The "nbdevquery -listdv -stype PureDisk -U" output shows the MSDP disk volume down.

Error Message
Status 2106

The backup job details shows this error:-

7/17/2012 10:25:06 AM - Info nbjm(pid=6732) starting backup job (jobid=9442) for client rbm-svr, policy Exchange, schedule Full
7/17/2012 10:25:06 AM - Info nbjm(pid=6732) requesting MEDIA_SERVER_ONLY resources from RB for backup job (jobid=9442, request id:{A163A2A9-88BB-4837-991E-2CD496E2D436})
7/17/2012 10:25:06 AM - requesting resource MSDP_STU01
7/17/2012 10:25:06 AM - requesting resource nbmaster.NBU_CLIENT.MAXJOBS.rbm-svr
7/17/2012 10:25:06 AM - requesting resource nbmaster.NBU_POLICY.MAXJOBS.Exchange
7/17/2012 10:25:06 AM - requesting resource EXCHANGE_RESOLVER.nbmaster.Exchange.rbm-svr
7/17/2012 10:25:06 AM - Error nbjm(pid=6732) NBU status: 2106, EMM status: Storage Server is down or unavailable
7/17/2012 10:25:06 AM - Error nbjm(pid=6732) NBU status: 2106, EMM status: Storage Server is down or unavailable
Disk storage server is down(2106)

Cause
On the MSDP media server, the "bpps.exe" output shows no spoold or spad processes running.
The Windows event viewer shows this error relating to spad...

The description for Event ID 1 from source spad cannot be found. Either the component that raises this event is not installed on your local computer or the installation is corrupted. You can install or repair the component on the local computer.
If the event originated on another computer, the display information had to be saved with the event.
The following information was included with the event:
2: Cannot access S:\MSDP\etc\pdregistry.cfg during Symantec PureDisk Storage Pool Authority startup. Quitting.

There are currently only 2 drives mounted, C:\ and D:\ , there is no S\ drive mounted.

Solution
Remount the missing MSDP drive (S:\) and restart Netbackup services on the media server.


Applies To

Windows 2008, Netbackup 7.5.0.1

** NBU Administration GUI/Console showing Drive status in MIXED or PEND Status
Article: 100007400
Last Published: 2013-10-26
Ratings:  0 0
Product(s): NetBackup
Problem
Drive status of defined drives show MIXED/PEND-TLD statuses

Error Message
Observation on GUI.

Backup jobs sometimes report failures allocating drives in a timely manner

Cause
Reservation conflicts.

Restart of a Media Server daemons or Services.

Solution
Restart affected Media Server and Master Server.

In regards to the drives showing up in the GUI in a Mixed or PEND-TLD state, the explanation is as below.
PEND-<robot_designation>

For example, PEND-TLD.

The drive is in a pending status.  Applies only to robotic drives.

MIXED
"The control mode for a shared drive may not be the same on all hosts sharing the drive.
For shared drives, each host can have a different status for the drive. If the control modes are all the same, that mode is displayed."

Reference:- DOCUMENTATION: The following list describes the current drive status field descriptions for drives within a Veritas NetBackup (tm) configuration.
https://www.veritas.com/docs/000026908
This would happen when some Media Servers sharing tape drives (i.e SSO) are restarted, while others are still up and running (sometimes even doing backups).

The best method to fix this would be to get a window, when NBU Daemons/Services can be Stopped and Started on ALL the Media Servers and the Master Server.

Suggest these steps to 'clean up' the drive control modes.

Note: The first set of commands are for UNIX, and the second set for Windows.

a. Cancel All Jobs                                         (Master Server)
    "bpdbjobs -cancel_all"
b. Suspend jobs and reset allocations and close GUI.                (Master Server)
    "nbpemreq -suspend_scheduling"
    "nbtbutil -resetAll"
    Close all NBU GUI's everywhere.                        (yes Everywhere)
c. Shut down NBU services/daemons                       (Master and ALL Media Servers)
    "bp.kill_all"    or   "bpdown -f -v"
d. Terminate all NBU Processes if any are found lingering around.           (Master and ALL Media Servers)
     "bpps -x"   or "bpps"
     "kill -9 <PID>"    or     "taskkill /PID <PID>"
e. Stop and start PBX on                                        (Master and ALL Media Servers)
$ cd /opt/VRTSpbx/bin/
    "vxpbx_exchanged stop"                                     (for Windows stop and start from Services.)
    "vxpbx_exchanged start"
f.  Start NBU daemons/services on Master
    "bp.start_all"  or "bpup -f -v"
g. Start NBU daemons/services on Media Servers which have Robotic Control
    "bp.start_all"  or "bpup -f -v"
h. Start NBU daemons/services on remaining Media Servers
    "bp.start_all"  or "bpup -f -v"
i.  Open GUI's NOW.


Applies To

NetBackup Servers.

** Disk Media is not active (backupserver3)
*** Troubleshooting steps
1st check if the active or inactive.

[root@backupserver1 ~]# /usr/openv/volmgr/bin/vmoprcmd -hoststatus -h backupserver3

                       CURRENT HOST STATUS

Host backupserver3 is ACTIVE-TAPE

That means 'backupserver3' media server is only active for tape only. It's not active for disks. I checked for other media servers.


[root@backupserver1 ~]# /usr/openv/volmgr/bin/vmoprcmd -hoststatus -h backupserver2

                       CURRENT HOST STATUS

Host backupserver2 is ACTIVE

[root@backupserver1 ~]# /usr/openv/volmgr/bin/vmoprcmd -hoststatus -h backupserver4

                       CURRENT HOST STATUS

Host backupserver4 is ACTIVE


*** How to activate it ?

[root@backupserver1 ~]# cd /usr/openv/netbackup/bin/admincmd/
[root@backupserver1 admincmd]# ./nbemmcmd -updatehost -machinename backupserver3 -machinetype media -machinestateop set_disk_active -masterserver backupserver1
NBEMMCMD, Version: 7.7.3
Command completed successfully.

[root@backupserver1 admincmd]#
[root@backupserver1 admincmd]#
[root@backupserver1 admincmd]# /usr/openv/volmgr/bin/vmoprcmd -hoststatus -h backupserver3

                       CURRENT HOST STATUS

Host backupserver3 is ACTIVE



To connect to master:

[root@backupserver1 admincmd]# ./nbemmcmd -updatehost -machinename backupserver3 -machinetype media -machinestateop set_master_server_connectivity  -masterserver backupserver1
NBEMMCMD, Version: 7.7.3
Command completed successfully.
[root@backupserver1 admincmd]# /usr/openv/volmgr/bin/vmoprcmd -hoststatus -h backupserver3
                       CURRENT HOST STATUS

Host backupserver3 is ACTIVE

[root@backupserver1 admincmd]#


*** Still it didn't solve the issue:
Then i googled with the error "nbjm_media_request() failed: 25, cannot continue with copy 1"
I found the following kb in Veritas.

$ bpps -x

pbx_exchange service is not running in media server.

I started it.

backupserver3:/usr/openv/netbackup/bin # /opt/VRTSpbx/bin/vxpbx_exchanged status
Symantec Private Branch Exchange is not running
backupserver3:/usr/openv/netbackup/bin # /opt/VRTSpbx/bin/vxpbx_exchanged start
Started Symantec Private Branch Exchange



*** Media server showing offline. Not active for tape and disk.
Article: 100006171
Last Published: 2018-10-01
Ratings:  15 2
Product(s): NetBackup
Problem
After adding new TEMP license keys, media servers are showing offline.

The same may happen too when Netbackup on affected media server was shutdown, before performing system/SAN changes or maintenance on the media server. Media server is not active for tape devices.

Error Message
Media server showing offline

Media server not showing "Active for Tape and Disk"

Solution
nbemmcmd command is located in:

Unix: /usr/openv/netbackup/bin/admincmd/
Windows: \Netbackup\bin\admincmd\

nbemmcmd -updatehost -machinename <mediaserver hostname> -machinetype media -machinestateop set_tape_active -masterserver <masterserver hostname>
(do this if media server is NOT active for tape)

nbemmcmd -updatehost -machinename <mediaserver hostname> -machinetype media -machinestateop set_disk_active -masterserver <masterserver hostname>
(do this if media server is NOT active for disk)

Sometimes the above may not work because connection is still not established between PBX, then you need to:

nbemmcmd -updatehost -machinename <mediaserver hostname> -machinetype media -machinestateop set_master_server_connectivity -masterserver <masterserver hostname>
(this shall reconnect master to media server)

Refresh Netbackup Admin console and media server status will be back to previous state.


Applies To

Netbackup 6.x & 7.x, applicable to all Operating System



*** Getting "nbjm_media_request() failed: 25, cannot continue with copy 1" on backups
https://www.veritas.com/support/en_US/article.100027075
Article: 100027075
Last Published: 2012-07-28
Ratings:  4 0
Product(s): NetBackup
Problem
Seeing the following error when running a backup

Error Message
From activity monitor:

17.4.2012 22:54:19 - Error bptm(pid=1514) nbjm_media_request() failed: 25, cannot continue with copy 1
17.4.2012 22:54:19 - Error bptm(pid=1514) INF - cannot connect on socket (25), cannot continue with copy 1
17.4.2012 22:54:19 - Info bptm(pid=1514) EXITING with status 25 <----------
17.4.2012 22:55:20 - Info bpbkar(pid=1513) done. status: 25: cannot connect on socket
17.4.2012 22:55:30 - awaiting resource media-hcart-robot-tld-1 Reason: Drives are in use, Media Server: media.domainname.com,
Robot Number: 1, Robot Type: TLD, Media ID: N/A, Drive Name: N/A,
Volume Pool: NetBackup, Storage Unit: media-hcart-robot-tld-1, Drive Scan Host: N/A

Cause
pbx_exchange is not running

Solution
Start pbx_exchange and then restart NetBackup
Veritas support Support
* How to avoid tape drixves showing as DOWN, or Device Path Missing in NetBackup (in a Windows environment) after a Media Server/s reboot.
Support
Knowledge base
100002002
Search all support & community content...

Article: 100002002
Last Published: 2019-05-06
Ratings:  3 3
Product(s): NetBackup
Problem
How to avoid tape drives showing as DOWN, or Device Path Missing in NetBackup (in a Windows environment) after a Media Server/s reboot.

Error Message
How to avoid tape drives showing as DOWN or Device Path Missing in NetBackup in a Windows environment after a Media Server(s) reboot.

Solution
Any changes made to devices or switches through which devices are connected require the following steps to be done to establish proper connectivity.

MASTER SERVER:

Suspend NB Scheduling by running:  ....\Veritas\netbackup\bin\admincmd\nbpemreq -suspend_scheduling
Suspend User initiated backups by running:   ...\Veritas\netbackup\bin\admincmd\bprdreq -terminate

Reference:-       How to prevent backup jobs from starting while running job complete so that maintenance can occur once all jobs have completed?
                          https://www.veritas.com/support/en_US/article.000038919



MEDIA SERVER:
Confirm from the Operating System perspective that the devices are being presented properly. Use the Windows Device Manager.
Delete phantom Devices

Reference:-       DOCUMENTATION: How to delete "ghost" or "phantom" devices from the Windows Device Manager when using Veritas NetBackup (tm)
                          https://www.veritas.com/docs/000042456




ON SAN SWITCHES:
Confirm that the switch is able to see the devices connected to it properly.
A switch reboot is best option. If switch reboot is not possible, disabling and enabling the ports on the switch allows a re-scan to find the devices connected.


MEDIA SERVERS:

Confirm that the robot(s) and tape drives are visible from the NetBackup perspective for each Media Server by running the following commands
Windows
Install_Location\Veritas\volmgr\bin\scan -tape

Install_Location\Veritas\volmgr\bin\tpautoconf -t

Install_Location\Veritas\volmgr\bin\scan -changer

Install_Location\Veritas\volmgr\bin\tpautoconf -r

 Linux
/usr/openv/volmgr/scan -tape

/usr/openv/volmgr/tpautoconf -t

/usr/openv/volmgr/scan -changer

/usr/openv/volmgr/tpautoconf -r


MASTER SERVER:

Reset all NBRB allocations in NetBackup (from Master Sever) by running:  ..\Veritas\netbackup\bin\admincmd\nbrbutil -resetAll


LOCALLY ON THE MEDIA SERVER OR FROM THE MASTER SERVER:

Gather a list of configured drives by running on the media server:  ...\Veritas\volmgr\bin\tpconfig -d
For each drive marked DOWN manually UP the drive by running the following on the media server:  ...\veritas\volmgr\bin\vmoprcmd -up <drive Index>
Or use this command to UP the drive from the Master Server :  ...\veritas\volmgr\bin\vmoprcmd -up <drive Index> -h <MEDIA-SERVER-HOSTNAME>

Note: The <drive Index> is the first column in the 'tpconfig -d' output.



ON THE MASTER SERVER:

Run the device configuration wizard to confirm devices are configured properly.
Perform a robot inventory update on all configured robots.
Resume NB Scheduling by running :  ...\veritas\netbackup\bin\admincmd\nbpemreq -resume_scheduling
Resume User initiated jobs by running:  ...\veritas\netbackup\bin\initbprd

Reference:-       How to prevent backup jobs from starting while running job complete so that maintenance can occur once all jobs have completed?
                        https://www.veritas.com/docs/000038919



Was this content helpful?

VOX Community Veritas.com
Visit our social dashboard
Privacy Policy Legal User agreement

* Veritas support Support
Support
Knowledge base
100023371
Search all support & community content...
How to delete "ghost" or "phantom" devices from the Windows Device Manager when using NetBackup
Article: 100023371
Last Published: 2012-06-06
Ratings:  4 4
Product(s): NetBackup
Problem
There are "ghost" or "phantom" devices from the Windows Device Manager when using NetBackup

Cause
Several things can contribute to the addition of ghost devices in the Windows Device Manager.  Some of these include adding or removing hardware, changes to tape drives or tape libraries, failure to use persistent binding, static indexing, or hard ALPAs on storage area network (SAN) equipment.  These sort of things allow changes to the SCSI device path presentation of a device to the operating system.  These "ghost" devices can retain Port, SCSI, Target, and logical unit number (LUN) information that conflict with the active devices being used by Windows.  Under these circumstances, hardware instability can result.

Running the device discovery wizard in NetBackup, for example, may list 20 tape drives when only 10 tape drives physically exist.  This information is being pulled from the operating system and can incorrectly associate tape device information with the NetBackup hardware configuration.  Also, when there are ghost devices, tape device drivers may "disappear" or roll back to the previous drivers after a tape device driver update.
Solution
To identify and remove the ghost devices from the Windows Device Manager, do the following:


1.  From the command prompt on the problem media server, run:

C:\>set devmgr_show_nonpresent_devices=1

C:\>start devmgmt.msc



2.  Then, select View from the drop down and select to Show Hidden Devices.


At this point, any ghost tape devices will be seen with lighter, transparent icon and can be removed.  This is done by right-clicking the ghost tape device and selecting " Uninstall".  A reboot of the machine should be performed following this action.  It may also be necessary to delete and re-add any of these devices being used by NetBackup, as the current NetBackup configuration may have been pointing to one of these ghost devices, rather than the active one.  Prior to re-configuring any devices for use with NetBackup, ensure no additional ghost entries have been created following the reboot of the server.




Was this content helpful?

VOX Community Veritas.com
Visit our social dashboard
Privacy Policy Legal User agreement


* Veritas support Support
Support
Knowledge base
100021232
Search all support & community content...
How to prevent backup jobs from starting while running job complete so that maintenance can occur once all jobs have completed?
Article: 100021232
Last Published: 2009-01-11
Ratings:  0 0
Product(s): NetBackup
Problem
How to prevent backup jobs from starting while running job complete so that maintenance can occur once all jobs have completed?
Solution
To preventuser initiated jobs from starting:
$/usr/openv/netbackup/bin/admincmd/bprdreq -terminate

To prevent scheduled backups from starting:
$/usr/openv/netbackup/bin/admincmd/nbpemreq -suspend_scheduling

To resumeprocessing of both user initiated and scheduled jobs:
$/usr/openv/netbackup/bin/initbprd
$/usr/openv/netbackup/bin/admincmd/nbpemreq-resume_scheduling

Please beaware that terminating bprd while Oracle or SAP backup jobs are active willresult in the indirect failure of the jobs.  The Oracle RMAN and SAPbrbackup utilities do not consider a backup operation complete until both theapplication backup job has completed and a subsequent image lookup has beensuccessful.  If bprd is terminated, the image lookup will fail and Oracleor SAP will discard the information for those backups.  The next backup forthe instances will include a second copy of the data.
In rareinstances, this may cause problems for Oracle if running NetBackup 6.5.5 orprior.  See E-Track 1633407 in the Related Documents section for additionaldetails.


Related Knowledge Base Articles
BUG REPORT: Oracle process crashes doing sbtinfo2 or sbtremove2 if client temporarily cannot connect to bprd on the master server.
Was this content helpful?

VOX Community Veritas.com
Visit our social dashboard
Privacy Policy Legal User agreement


* Cleaning up catalog
Shows the catalog cleanup time and wait time
$ bpconfig -U


After expiration of backup images, the following command is used to run the clean up process to free up space from the deduped storage
$ bpimage -cleanup -allclients

* Windows client firewall issue solve.
1. Stop the firewall.
2. Test connection
3. Add the program bpcd, vnetd, pbx_exchange.
4. Open the ports
   pbx_exchange --> 1556 (most important))
   bpcd --> 13782
   vnetd --> 13724
5. Start the firewall.

Test client connectivty
$ bptestbpcd -client <client_machine_name> -debug -verbose

* StoreOnce integration with the Netbackup.
Create stores under storeonce catalyst
Note down the storeonce catalyst identifier.
Note down the target device pwwn.

Check in the san switch if you fcping pwwn.
Then zone the storeonce catalyst pwwn with media server.

Open Netbackup GUI console.
Select the top item --> server name.
Select 'Configure Disk Storage Servers'.
Select 'Open Storage'.

Media Server --> Media server name.
Storage server type: hp-StoreOnceCatalyst
Storage server name: Put the catalyst identifier name 'COFC-.....'
Credentials is the same which we use to login.

Then under 'Media and Device Management' -> Credentials -> 'Storage servers', the catalyst will be visible.

Then under 'Media and Device Management' -> Devices -> 'Disk Pools',
[1] Restart the 'Media Manager Device Daemon'
[2] Then right click -> select 'New Disk Pool'.
[3] Select the Storage server type -> OpenStorage (hp-StoreOnceCatalyst). Select Next.
[4] Select the desired storage server name. Select Next.
[5] It will show the list of volume names. Select that you want to add. It will ask if I want to create storage unit automatically corresponding to this disk pool. Select 'Yes'
[6] Then go to 'NetBackup Management' -> 'Storage Units'. You will find that stu created.

Now you can use this stu in backup job policy or in storage lifecycle policy.

* Checking the policy in screen mode

./nbpemreq -policies screen TSP01 | less

* Need to fix the number of entries in the activity monitor

C:\Program Files\Veritas\NetBackup\bin\admincmd>bpgetconfig | findstr KEEP
KEEP_DATABASE_COMM_FILE = NO
KEEP_LOGS_DAYS = 3
KEEP_LOGS_SIZE_GB = 0
KEEP_VAULT_SESSIONS_DAYS = 30
KEEP_JOBS_SUCCESSFUL_HOURS = 78
KEEP_JOBS_HOURS = 78
KEEP_DBM_IMAGECHANGELOG_DAYS = 7
CLIENT_KEEP_LOG_DAYS = 0
NBRNTD_MIN_KEEP_ALIVE_TIME = 30
NBRNTD_MAX_KEEP_ALIVE_TIME = 60


Need to change all the synthetic backups.

echo KEEP_JOBS_HOURS = 744 | bpsetconfig
echo KEEP_JOBS_SUCCESSFUL_HOURS = 744 | bpsetconfig


* Time issue
Be very careful of the time settings in the master server and media servers.
If there is time mismatch or even timezone mismatch between the netbackup console host and netbackup master server, then scheduling and firing up jobs will mismatch and even jobs might not fire. 
Finding out how the timezone mismatch can create this issue is mind-boggling.

Better follow below steps in Netbackup master, media and console hosts:
Correct the time.
Correct the timezone.



* Add the following processes in Sophos on-access scanning exclusion list.
C:\Program Files\Veritas\NetBackup\bin\bpbkar32.exe

C:\Program Files\Symantec\Backup Exec\RAWS\beremote.exe
C:\Program Files\Veritas\Backup Exec\beremote.exe

C:\Program Files\Veritas\Backup Exec\beremote.exe
C:\Program Files\Veritas\Backup Exec\benetns.exe
C:\Program Files\Veritas\Backup Exec\bedbg.exe
C:\Program Files\Veritas\Backup Exec\bengine.exe
C:\Program Files\Veritas\Backup Exec\pvlsvr.exe
C:\Program Files\Veritas\Backup Exec\beserver.exe
C:\Program Files\Veritas\Backup Exec\BackupExec.exe


* SAP HANA Backup
** Create 2 policies
*** HANA
This policy will have the policty type as SAP.
Schedule type is 'Automatic Full Backup'
*** Log
Log backup is standard for Linux

** Add the below backup script.
Location is under /usr/openv/netbackup/ext/db_ext/sap/scripts/sap_hanadb_backup.sh

*** Script
#+BEGIN_SRC bash

# cat /usr/openv/netbackup/ext/db_ext/sap/scripts/sap_hanadb_backup.sh
#!/bin/sh

#bcpyrght
#***************************************************************************
#* $VRTScprght: Copyright 2013 Symantec Corporation, All Rights Reserved $ *
#***************************************************************************
#ecpyrght

#
# NOTE:
#       1. Provide the path of "hdbsql" as "/usr/sap/<SID>/HDB01/exe/hdbsql"
#       2. Need to modify below hdbsql command according to your configuration with options as
#          ../hdbsql -i <instance_id> -n <database_host>
#                    -u <database_user> -p <database_user_password>
#          Modify the below "hdbsql" commands by using proper <SID> name
#       3. SAP HANA Master name and hostname of that Node must be same
#

SID="<SID>"
INSTANCE_ID="INSTANCE_ID"
DATABASE_HOST="Server Host Name"
DATABASE_USER="Database user name"
DATABASE_USER_PASSWORD="database user password"


RETURN_STATUS=0
#
# Get the SAP HANA master server
#
SAP_SERVER="`/usr/sap/$SID/HDB10/exe/hdbsql -i $INSTANCE_ID -n $DATABASE_HOST -u $DATABASE_USER -p $DATABASE_USER_PASSWORD -j -a -x \"select HOST from M_SERVICES WHERE COORDINATOR_TYPE='MASTER' LIMIT 1\"`"
#
RETURN_STATUS=$?
#

if [ "$RETURN_STATUS" -ne 0 ] ; then
                                echo "Could not get SAP HANA master node, db connection failed"
                                exit $RETURN_STATUS
fi
# Check if SAP HANA master node is present
#
if [ "$SAP_SERVER" == "" ] ; then
        echo "SAP HANA Master node is not present"
fi
#
# Remove quotes from SAP_SERVER (HANA master) name string
#
SAP_SERVER="`echo "$SAP_SERVER" | sed s'/\"//g'`"
#
# Convert the SAP HANA master name to small letters
#
SAP_SERVER=`echo $SAP_SERVER | tr "[A-Z]" "[a-z]"`
echo "SAP_SERVER = $SAP_SERVER"
#
# Get HOST NAME
#
HOST_NAME="`hostname`"
#
# Convert the current node host name to small letters
#
HOST_NAME=`echo $HOST_NAME | tr "[A-Z]" "[a-z]"`
echo "HOST_NAME = $HOST_NAME"
#
# Check SAP HANA MASTER with HOST NAME
# IF both are same then start backup
# Then trigger backup from SAP HANA master node
#
HOST_NAME=`echo $HOST_NAME | tr "[A-Z]" "[a-z]"`
echo "HOST_NAME = $HOST_NAME"

if [ "$SAP_SERVER" == "$HOST_NAME" ] ; then
#
# Get the current date and time
#
        DATE_TIME="`date \"+%Y%m%d_%H_%M_%S\"`"
#
# Build the BACKUP PREFIX by appending DATE and TIME
#
        BACKUP_PREFIX="COMPLETE_DATA_BACKUP"
        BACKUP_PREFIX="$BACKUP_PREFIX"_"$DATE_TIME"
        echo "HANA_BACKUP_PREFIX = $BACKUP_PREFIX"
#
# Start BACKUP Query on SAP HANA master
#
        #/usr/sap/<SID>/HDB01/exe/hdbsql -i 0 -n localhost -u SYSTEM -p Pa55w0rd "backup data using backint ('$BACKUP_PREFIX')"
        /usr/sap/$SID/HDB10/exe/hdbsql -i $INSTANCE_ID -n $DATABASE_HOST -u $DATABASE_USER -p $DATABASE_USER_PASSWORD "backup data using backint ('$BACKUP_PREFIX')"
#
        RETURN_STATUS=$?
        exit $RETURN_STATUS
else
#
# For Worker node exit bphdb with 0
# So all bphdb jobs which are invoked on Worker node will be get successful compelete
#
        echo "Backup is started from SAP HANA Master"
        echo "Worker Node will exit with sucess status"
        exit 0
fi
IDWIKVDSRMJ01:~ #

#+END_SRC

** Create the init<SID>.utl file
Place the file in /usr/openv/netbackup/ext/db_ext/sap/scripts/init<SID>.utl
$ cat /usr/openv/netbackup/ext/db_ext/sap/scripts/init<SID>.utl | grep -v ^#

switch_list /hana/data/<SID>/mnt00001/.switch.lis
switch_sem /hana/data/<SID>/mnt00001/.switch.sem
switch_log /hana/data/<SID>/mnt00001/.switch.log
server <netbackup-master-server-name>
client <netbackup-client-name>
drives 2
policy <netbackup-client-hana-policy-name>
schedule Default-Application-Backup
policy_log <netbackup-client-log-policy-name>
sched_log Save_Archive_Log
retry_backup 2

** Create the folder for param file
mkdir /usr/sap/DSR/SYS/global/hdb/opt/hdbconfig
cd /usr/sap/DSR/SYS/global/hdb/opt/hdbconfig
ln -s /usr/openv/netbackup/ext/db_ext/sap/scripts/init<SID>.utl param

* Reporting
To accomplish this backup reporting task, you will have to install Opscenter server on a separate server and then you can schedule any template report or create a custom report and it can also be scheduled to deliver on your email in desired format (Csv/Html/etc).

https://www.veritas.com/support/en_US/doc/27537447-127427700-0/index

Also shared below KB articles for some important Netbackup commands to generate custom reports from master server:

> bpimagelist : produce status report on client NetBackup images or removable media.

https://www.veritas.com/support/en_US/doc/123533878-127136857-0/v123538598-127136857

> bpdbjobs : interact with NetBackup jobs database.

https://www.veritas.com/support/en_US/doc/123533878-127136857-0/v123536850-127136857

> nbdeployutil

https://www.veritas.com/support/en_US/doc/123533878-127136857-0/v123549289-127136857

> Some other commands:

+ bpclimagelist command generates status reports on client NetBackup images or removable media.

+ bperror displays information from either the same source as the online troubleshooter (in the Activity Monitor or Reports applications) or from the NetBackup error catalog.

+ bpflist command shows a list of previously archived or backed up files according to the options that you specify.

+ bpimage : perform functions on stored images in a database.

+ bpimmedia queries the NetBackup image catalog and produces the following two types of reports on the images:

■ An Images-on-Media report
■ A Spanpools report

+ bpmedialist queries one or more NetBackup media catalogs and produces a report on the status of the NetBackup media.

For more set of commands refer the Netbackup command line pdf guide for detailed information and examples with options.

https://www.veritas.com/content/support/en_US/doc/ka6j00000000A9vAAE


## Process Names:
NetBackup Policy Execution Manager (nbpem) triggers a backup job once the policy, schedule, virtual machine combination is due and backup window is open. It works in conjunction with NetBackup Job Manager (nbjm), NetBackup Resource Broker (nbrb) and NetBackup Enterprise Media Manager (nbemm) to identify the resources (media server, storage unit etc.) for backup.

| Process Name | Description                        |
|--------------+------------------------------------|
| nbpem        | NetBackup Policy Execution Manager |
| nbjm         | NetBackup Job Manager              |
| nbrb         | NetBackup Resource Broker          |
| nbemm        | NetBackup Enterprise Media Manager |
| bpbrm        |                                    |
| bpfis        |                                    |
|              |                                    |



## How to check if a VMware datastore is presented on SAN to a Linux NetBackup host or a NetBackup Appliance
Article: 100039119
Last Published: 2020-02-28
Ratings:  12 4
Product(s): Appliances, NetBackup
Description

For VMware backups to use the SAN transport mode, the Datastore LUNs must be accessible to the VM backup host.

Here is how to check if a datastore has been presented to a NetBackup Appliance or a Linux VM backup host :

Find a VMware ESXi host connected to the datastore in question.
Enable SSH on the ESXi host and log into the shell prompt under the root account. For more information, refer to this VMware KB article: https://kb.vmware.com/kb/2004746

Run the following command at the ESXi shell prompt, replacing <Datastore name> with the name of the Datastore in question: ```vmkfstools -P -v10 /vmfs/volumes/<Datastore name> | grep device```

Observe the output: Logical device: 58cdf60d-ba933b51-4ae6-00505605cc16
Note the Logical device number  this is the same as the Datastore Logical Volume Identifier - LVID.
On the NetBackup Appliance elevated prompt or superuser (root) prompt on a Linux backup host, run the following command filtering the output to find the Logical device value from step 4:
lsblk -l -o +UUID | grep 58cdf60d-ba933b51-4ae6-00505605cc16
If the lsblk command is not available, use the blkid command instead:
blkid | grep 58cdf60d-ba933b51-4ae6-00505605cc16
Observe the output:
bh1:/home/maintenance # lsblk -l -o +UUID | grep 58cdf60d-ba933b51-4ae6-00505605cc16
sdb1 8:17 0 40G 0 part 58cdf60d-ba933b51-4ae6-00505605cc16
If the output is not empty then the Datastore is presented to the backup host over the path(s) shown - /dev/sdb1 in the example above.
If the output is empty then the Datastore is not presented and backups with SAN transport will fail with error status 23.   In case of a backup failure, the same LVID can be seen in VxMS provider log  search for “No path to device”:
8:21:41.0806 : g_vixInterfaceLogger:libvix.cpp:1800 <DEBUG> : [VFM_ESINFO] 2017-05-05T08:21:41.806-04:00 trivia -[03732] [Originator@6876 sub=Default] Attempting to open LVID:58cdf60e-ed802bbf-66d2-00505605cc16/58cdf60d-ba933b51-4ae6-00505605cc16/1. 08:21:41.0806 : g_vixInterfaceLogger:libvix.cpp:1800 <DEBUG> : [VFM_ESINFO] 2017-05-05T08:21:41.806-04:00 error -[03732] [Originator@6876 sub=Default] No path to device LVID:58cdf60e-ed802bbf-66d2-00505605cc16/58cdf60d-ba933b51-4ae6-00505605cc16/1 found.
In case of VMFS6 Datastore, we can verify LUNs using disk WWID.
In the ESXi host, search the Datastore for naa (Disk WWID) -
On the ESX search the datastore for the naa (Disk WWID)

```$ vmkfstools -P -v10 /vmfs/volumes/<datastore name>/ | grep naa```
we will get a naa output, like naa.abcxyz123abc

Next, on the Appliance search for that WWID:
```$ lsscsi --scsi_id | grep abcxyz123abc```
we will see the corresponding output here

Example -
```lsscsi --scsi_id | grep abcxyz123abc```
[5:0:7:3]    disk    3PARdata VV               3313  /dev/sdazd  369002acdbxyfr0000000000800025409

## How to do device discovery from command line for NetBackup device configuration.
Article: 100029577
Last Published: 2020-04-09
Ratings:  10 4
Product(s): NetBackup
Problem
How to do device discovery from command line for NetBackup device configuration.

Solution
The commands to scan and discover attached robots and tape devices are tpautoconf and scan.  On Solaris platform the script sgscan can also be used.
These commands are located under the default "volmgr/bin" path:


Windows: C:\Program Files\Veritas\Volmgr\bin\
UNIX: /usr/openv/volmgr/bin/

How-to:
A) Scan and discover locally attached tape drives: tpautoconf -t
B) Scan and discover locally attached robotic devices (via SCSI and SAN): tpautoconf -r
C) Scan all locally attached devices: scan (or sgscan - Solaris only)
D) Scan and provide detailed robotic inquiry (for locally attached robot): scan -changer
For complete usage and additional switches, please review the NetBackup Command Reference Guide

## How to identify the HBA cards/ports and WWN in Linux
There are several commands to determine the WWN of a Fibre Channel (FC) HBA and their status (online/offline). The post discusses few of the most commonly used methods.

### Method 1
To find the HBA cards installed on your system use :
```
$ lspci -nn | grep -i hba
07:00.0 Fibre Channel [0c04]: QLogic Corp. ISP2532-based 8Gb Fibre Channel to PCI Express HBA [1077:2532] (rev 02)
07:00.1 Fibre Channel [0c04]: QLogic Corp. ISP2532-based 8Gb Fibre Channel to PCI Express HBA [1077:2532]
```


To check the available HBA ports :
```
$ ls -l /sys/class/fc_host
total 0
drwxr-xr-x 3 root root 0 Feb  3  2015 host2
drwxr-xr-x 3 root root 0 Feb  3  2015 host3
```

To find the state of HBA ports (online/offline) :
```
$ more /sys/class/fc_host/host?/port_state
::::::::::::::
/sys/class/fc_host/host2/port_state
::::::::::::::
Online
::::::::::::::
/sys/class/fc_host/host3/port_state
::::::::::::::
Online
```

To find the WWN numbers of the above ports :
```
$ more /sys/class/fc_host/host?/port_name
::::::::::::::
/sys/class/fc_host/host2/port_name
::::::::::::::
0x500143802426baf4
::::::::::::::
/sys/class/fc_host/host3/port_name
::::::::::::::
0x500143802426baf6
```

##  Method 2 : Using systool
Another useful command to find the information about HBAs is systool. If not already install, you may need to install the sysfsutils package.

# yum install sysfsutils
To check the available HBA ports :

# systool -c fc_host
Class = "fc_host"

  Class Device = "host2"
    Device = "host2"

  Class Device = "host3"
    Device = "host3"
To find the WWNs for the HBA ports :

# systool -c fc_host -v | grep port_name
    port_name           = "0x500143802426baf4"
    port_name           = "0x500143802426baf6"
To check the state of the HBA ports (online/offline) :

# systool -c fc_host -v | grep port_state
    port_state          = "Online"
    port_state          = "Online"
=======
* Error "NOT using change journal data" while running backup job with Accelerator
Support
Knowledge base
100010315
Search all support & community content...
Article: 100010315
Last Published: 2018-01-03
Ratings:  3 1
Product(s): NetBackup
Problem
Change Journal is enabled but it cannot be validated.


Error Message
10/09/2012 10:04:31 - Info bpbkar(pid=12460) change journal enabled for <C:\>
10/09/2012 10:04:41 - Info bpbkar(pid=12460) NOT using change journal data for <C:\>: unable to validate change journal usage <reason=snapshot needed to flush open files to databases>
10/09/2012 10:10:09 - Info bpbkar(pid=12460) change journal enabled for <E:\>
10/09/2012 10:10:09 - Info bpbkar(pid=12460) NOT using change journal data for <E:\>: unable to validate change journal usage <reason=snapshot needed to flush open files to databases>
10/09/2012 10:10:31 - Info bpbkar(pid=12460) change journal enabled for <F:\>
10/09/2012 10:10:32 - Info bpbkar(pid=12460) NOT using change journal data for <F:\>: unable to validate change journal usage <reason=snapshot needed to flush open files to databases>
 
Cause
(Windows) Change Journal corruption.

 

Solution
1. Stop NetBackup services on the client.

Open Command Prompt with "Run As Administrator"
Change directories to: install_path\NetBackup\bin\
Run command: bpdown -v -f
Verify all NetBackup processes are stopped by running: bpps.exe
If there are still running NetBackup processes, such as bpfis.exe, terminate them manually.
2. Delete the NTFS change journal for each problem drive letter, or disk volume:

For each drive letter, or disk volume, run the following commands:
Go to a command prompt and query the USN Change Journal using command:
fsutil usn queryjournal <drive letter:>
To delete the NTFS journal, run the following command:
fsutil usn deletejournal /D <drive letter:>
For example using the C: drive: 
fsutil usn deletejournal /D C:
Also, remove the three Veritas NetBackup Change Journal database files on the root of the related drive letter, or disk volume.
For example using the C: drive:
C:\VxCJinfo.dat
C:\VxCJdelete.dat
C:\VxCJmon.dat
3. Start NetBackup services on the client:

Open Command Prompt with "Run As Administrator"
Change directories to: install_path\NetBackup\bin\
Run command: bpup -v -f
 

Was this content helpful?
 
VOX Community Veritas.com
Visit our social dashboard     
Privacy policy Legal User agreement

* DFSR backup configuration notes



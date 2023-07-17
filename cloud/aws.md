
# Documents to Read
AWS Documentation
Guides and API references: https://docs.aws.amazon.com/index.html

Blogs to read

Perspectives: https://perspectives.mvdirona.com/
All Things Distributed: https://www.allthingsdistributed.com/

# Snapshot
** From snapshot -> Create volume
Can be changed:
volume type
volume size
availability zone
encryption

** From snapshot -> Create snapshot
Can be changed:
Region
Encryption


* In memeory caching engines
ElasticCache is a web service that makes it easy to deploy, operate, and scale and in-memory cache in the cloud.
ElasticCache supports two opensouce in-memory caching engines
memcached
redis

# databases
** RDS (OLTP)
SQL
MySQL
Oracle DB
PostGreSQL
Amazon Aurora
MariaDB
Amazon DynamoDB (No SQL)
Redshift OLAP - Amazon Data Warehouse Solution

* Bootstrap script
** For RDS
#!/bin/bash
yum update -y
yum install httpd php php-mysql -y
cd /var/www/html
curl -O https://wordpress.org/latest.tar.gz
tar -xfz latest.tar.gz
cp -r wordpress/* /var/www/html
rm -rf wordpress
rm -rf latest.tar.gz
chmod -R 755 wp-content
chown -R apache:apache wp-content
chkconfig httpd on
service httpd start


* bits to check
Storage
SAN
ISM
Vmax

lsblk
iscsi
parted
fdisk
ext2
ext3
ext4
init vs sytemd


vol-0abca1990211ca66d, vol-0a235245407550301, vol-0f1f97963cff17a1a


## Elastic File System (EFS)
sudo mount -t efs fs-e08e4503:/ efs
[root@ip-172-31-92-143 mnt]# mount
sysfs on /sys type sysfs (rw,nosuid,nodev,noexec,relatime)
proc on /proc type proc (rw,nosuid,nodev,noexec,relatime)
devtmpfs on /dev type devtmpfs (rw,nosuid,size=485720k,nr_inodes=121430,mode=755)
securityfs on /sys/kernel/security type securityfs (rw,nosuid,nodev,noexec,relatime)
tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev)
devpts on /dev/pts type devpts (rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=000)
tmpfs on /run type tmpfs (rw,nosuid,nodev,mode=755)
tmpfs on /sys/fs/cgroup type tmpfs (ro,nosuid,nodev,noexec,mode=755)
cgroup on /sys/fs/cgroup/systemd type cgroup (rw,nosuid,nodev,noexec,relatime,xattr,release_agent=/usr/lib/systemd/systemd-cgroups-agent,name=systemd)
pstore on /sys/fs/pstore type pstore (rw,nosuid,nodev,noexec,relatime)
cgroup on /sys/fs/cgroup/blkio type cgroup (rw,nosuid,nodev,noexec,relatime,blkio)
cgroup on /sys/fs/cgroup/cpu,cpuacct type cgroup (rw,nosuid,nodev,noexec,relatime,cpu,cpuacct)
cgroup on /sys/fs/cgroup/net_cls,net_prio type cgroup (rw,nosuid,nodev,noexec,relatime,net_cls,net_prio)
cgroup on /sys/fs/cgroup/perf_event type cgroup (rw,nosuid,nodev,noexec,relatime,perf_event)
cgroup on /sys/fs/cgroup/pids type cgroup (rw,nosuid,nodev,noexec,relatime,pids)
cgroup on /sys/fs/cgroup/freezer type cgroup (rw,nosuid,nodev,noexec,relatime,freezer)
cgroup on /sys/fs/cgroup/memory type cgroup (rw,nosuid,nodev,noexec,relatime,memory)
cgroup on /sys/fs/cgroup/devices type cgroup (rw,nosuid,nodev,noexec,relatime,devices)
cgroup on /sys/fs/cgroup/cpuset type cgroup (rw,nosuid,nodev,noexec,relatime,cpuset)
cgroup on /sys/fs/cgroup/hugetlb type cgroup (rw,nosuid,nodev,noexec,relatime,hugetlb)
/dev/xvda1 on / type xfs (rw,noatime,attr2,inode64,noquota)
systemd-1 on /proc/sys/fs/binfmt_misc type autofs (rw,relatime,fd=31,pgrp=1,timeout=0,minproto=5,maxproto=5,direct,pipe_ino=14171)
hugetlbfs on /dev/hugepages type hugetlbfs (rw,relatime,pagesize=2M)
debugfs on /sys/kernel/debug type debugfs (rw,relatime)
mqueue on /dev/mqueue type mqueue (rw,relatime)
sunrpc on /var/lib/nfs/rpc_pipefs type rpc_pipefs (rw,relatime)
tmpfs on /run/user/1000 type tmpfs (rw,nosuid,nodev,relatime,size=100728k,mode=700,uid=1000,gid=1000)
fs-e08e4503.efs.us-east-1.amazonaws.com:/ on /mnt/efs type nfs4 (rw,relatime,vers=4.1,rsize=1048576,wsize=1048576,namlen=255,hard,noresvport,proto=tcp,timeo=600,retrans=2,sec=sys,clientaddr=172.31.92.143,local_lock=none,addr=172.31.84.29)
* aws cli
To attach a gateway with VPC
aws ec2 attach-internet-gateway --vpc-id "vpc-0814b4de9f8f93524" --internet-gateway-id "igw-09d552c517992113d" --region us-east-1



# Notes from a youtube course
AWS Certified Cloud Practitioner Certification Course (CLF-C01) - Pass the Exam!
Link: https://www.youtube.com/watch?v=SOTamWNgDKc&t=3366s



Peijun Wu
3 months ago (edited)
Tracking my progress: 12:27:30
Notes:
1. Allocate 120 minutes. Actual exam is 90 minutes.
2. 50 scored questions and 15 unscored (too hard / too easy / unseen)
3. Always create IAM user instead of using root account. IAM user common policies are Admin, PowerUsers, etc
4. General computing : EC2. GPU Computing : Infer1. (compete against tpu in gcp). Quantum: AWS Bracket.
5. Data centers within a region are isolate from each other (different buildings), but close enough to provide low latency (< 10ms), therefore they usually have the same impact, and HA is defined as being available in 2/3 different AZs. Subnets are associated with AZs. You pick subnets instead of picking AZs for EC2, for instance. Default subnets are created one subnet per AZ. Managed HA services will replicate in multiple AZs behind the scene in each region so you don't need to pick (e.g., S3.). CloudFront distribution uses "area" which covers many regions. Global services like IAM doesn't even have concept of region.
6. Fault Domain: isolated physical construct where failure / fault will not impact other fault domains. Fault level: A collection of fault domains. Fault Domains can be nested.

Network:
1. AWS Global Network: interconnections between AWS Global Infrastructure. Commonly referred to as "the backbone of AWS". It's private networks, where things can move very fast/consistent/reliable/secure without internet topology disruptions between data centers.
    A. Edge Locations: on and off ramps to the AWS Global Network.
    B. AWS Global Accelerator : Use edge locations as on-ramps to quickly reach AWS resources by traversing the fast Global Network. One great use case is when you deploy your web application in one region, and you can use AWS global accelerator to boost your response time globally.
    C. Amazon CloudFront (CDN): Uses edge locations as an off-ramp to provide at the edge storage and compute near the end user
    D. VPC endpoints: Ensuring your resources stay within AWS network and do not traverse over the public internet.
2. PoP: data center for content delivery or expedited upload.
    A. Edge locations: holds cached copy of the popular files
    B. Regional Edge Locations: hold large cache of less-popular files to reduce full round trip and reduce cost of transfer fees.
3. AWS Direct Connect: Private / Dedicated connection that provides private, consistent and reliable network between your on-prem data center to the AWS Cloud.
4. Local Zones (Opt-in feature): data centers close to densely populated area to provide single-digit millisecond low latency performance for that area. The identifier looks like us-west-2-lax--1a. Only certain services are available.
5. Wavelength Zones: ultra low latency edge-computing on 5G networks. (e.g., deploy Ec2 instance to hardware in a 5G networks.)

Compliance & Policy (& Permissions):
1. Data Residency: The physical location where the servers and data reside for an organization.
2. Compliance Boundaries: Regulatory compliance / legal rules by a government that describes where data and services are allowed to reside.
3. Data Sovereignity: legal authority / juristic control asserted on data within juristic boundaries.
4. AWS Config: Policy as Code service. You can create rules that continuous check AWS resource configuration. If they deviate (someone accidentally deploy to a wrong region), you can get alerted / the service can auto-fix the deviation.
5. IAM policies: role/group - level permissions that directly deny access to certain things. Service Control Policy (SCP) on the other hand manages permissions organization/account-wide.
6. Gov Cloud: special regions for public sectors

Disaster Recover Options:
1. Back up & Restore: Hours
2. Pilot light(data is replicated with minimal services running) : 10 min
3. Warm Standby (Scaled down copy of infra ready to scale up): min
4. Hot standby (multi-site active/active, basically double the cost, scaled up copy): real-time

AWS Account ID: globally unique, 12 digits, assigned for every user
(root and non-root IAM users), can be associated with alias,  can assume cross-account roles, or assume principals in policies, to access resources under other accounts (ownerID is another account).

ARN: AWS Resource Names uniquely identify AWS resources. Unambiguously specify a resource across all of AWS.
arn:<partition>:<service>:<region>:<account-id>:<resource-id>
arn:partition:service:region:account-id:resource-type/resource-id
arn:partition:service:region:account-id:resource-type:resource-id

where partition can be aws, aws-cn, aws-us-gov.

Since ARN address is hierarchical, you can use * to specify a group of resources in policies, etc: arn:partition:service:region:account-id:*

IAC:
CloudFormation (CFN): JSON/YAML, declarative, can be huge and not as dynamic (hard to create repeated infra). The infra CFN creates is called stack.
CDK: Imperative, web programming language e.g., Python, can be more dynamic, generates CFN. Easier to create CICD pipelines than CFN. AWS CDK vs. AWS SDK? AWS CDK ensures idempotence of your infrastructure.
CDK constructs: reusable cloud components. constructs.dev (similar to Terraform modules).

EC2: virtual machines. "instance".
AMI: predefined configuration for EC2 - amount of CPU, amount of memory, network bandwidth, OS, storage options such as EBS.
EC2 is considered the backbone of AWS as many services use EC2 as underlying servers -- S3, RDS, DDB, Lambdas, etc
=======
## AWS Security

Security
- Amazon Maice - Discover and protect your sensitive data
- AWS Key Management Service - Store and manage encryption keys
- AWS CloudHSM - Hardwarebased key storage
- AWS Certificate Manager  provision 
- AWS secret Manager
  - protects the secrets required to access the resources.
  - rotates automatically
  - stores passwords, keys and tokens


Infrastructure Protection
- AWS shield
- AWS Web application fw
- aws firewall manager

threat detection
- amazon guard duty
- amazon inspector
- aws config
- aws cloudtrail

Identity management
- aws iam
  - iam users
    root user
  - iam policy
  - iam role: service or user cas assume a role.
- aws single sign-on
- aws directory service
  - Managed Microsoft AD
  - Managed Simple AD
  - AD connector - allow on pemise users to login to aws applications with AD
  - distributed service with automatic failover
  - compatible with other aws services
  - aws organizationsk

Management and governance
  - Account management services
    - AWS control tower
    - AWS org
    - aws budgets
  - Provisioning Services
    - aws cloudformation
      - Templates
      - json or yaml settings.
      - specify all the configuration to the cloudformation. It will generate the full infrastructure
      - Full infrastructure with version control systems
      - Nesting templates
      - automation devops engineer can use it for automaiton
      - scale
    - aws service catalog
    - aws ops works
    - aws marketplace
  - Operation services
    - amazon cloudwatch
      - monitoring
      - collect metrics from services
      - integrates with 70+ aws services
      - lots of pre-defined metrics
      - log storage
      - ssh login logs -> cloudwatch logs -> cloudwatch filter -> cloudwatch alarm
    - aws config
    - aws cloudtrail
    - aws systems manager
    - amazon x-ray
    - autoscaling
      - minimum size
      - desired size
      - scale out to the maximum
      - high availability
      - better fault tolerance
      - better cost management
      - ec2, dynamodb, aurora

Machine Learning
  - Amazon Kendra
  - Amazon Personalize

  
Machine learning tools
  - Lookout for Metrics
  - Forecast
  - Fraud Detector


  Rekognition - Analyze images, object and scene detection

Polly
Transcribe
Lex


# Storage and Database
## Storage
   EBS - Elastic Block Store = Block Disk
   EFS - Elastic File Store = NFS Share
   S3  = Simple Storage Service = Object Storage
## Databases
   Amazon RDS = Relational Database Service = MySQL, PostgreSQL, Oracle, Microsoft SQL
   Amazon Aurora = MySQL or PostgreSQL compatible, redundant, highly available, auto patched and backed up.
   DynamoDB = key-value database for simple lookup table.
   Redshift = for dataware housing purpose where BI (business intelligence) processes will run on the past data for analysis.
   DocumentDB = More than just key-value pair database. It's full-fledged database. NoSQL DB. Json Format. MongoDB compatible.
   Neptune = Graph Datbaase. (like neo4j?). Recommendiation engines. Fraud database.
   Amazon Quantum Ledger Database (QLDB) = for immutable data requried in banking sector.

   


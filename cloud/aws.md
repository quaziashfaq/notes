# Features
- On-demand software-based resources.
- Available in seconds
- Pay-as-you-go pricing

# Regions
- Regions are completely isolated from each other.
- Certain resources are tied to regions.
- Each region has datacenters which are called availability zone.

# Availability Zones
- AZs are isolated from other AZs withing the region.
- AZs are connected with high-speed, low-latency connection within a region.

# Misc
- Web and mobile apps
- Data processing and warehousing
- Storage and Archiving

# Core Techs
## Compute
### Amazon EC2 - resize compute capacity
#### Features
- elasticity
- complete control
- flexibility
- integrated
- reliable - highly available
- secure
- inexpensive
#### Machine Types
- General Purpose: A, T, M
- Compute Optimized
- Memory Optimized
- Accelerated computing
- Storage Optimized

Amazon Machine Images (AMI)

### Amazon EC2 Auto Scaling: increase or decrease number of instances
automatically add or remove instances to adapt to demand
monitor the health of running instances
replace impaired instances automatically
balance capacity across availability zones
dynamic and predictive scaling

### Elastic Load Balancing: Distribute incoming traffic
Automatically distribute traffic across multiple EC2 instances
Increase availability and fault tolerance
Configure health checks
Offload encryption and decrytion
Types:
    - Application load balancer
    - Network load balancer
    - Classic laod balancer

### AWS Lambda: Run code in response to events

### Amazon Elastic Containe Service
Run applications on a managed cluster (docker)

## Storage Service
A reliable, scalable, and secure place for data
### Amazon Elastic Block Store (EBS):
Durable Persistent Block Level Storage
Replicate every EBS volume.
- Network-attached block storage for use with Amazon EC2 instance
  - Persist independently from instance
  - Used like a physical hard drive
  - Automatically replicated
  - Attached to any instance in the same az
  - One EBS voluem to one EC2 instance
  - One EC2 instance to many EBS volumes
  - EBS volumes can retain data after EC2 instance termination
  - Allow point-in-time snapshots to S3
  - 1 GiB increments
  - Size can be from 1 GiB to 16TiB
  - EBS snapshots can be copied between regions

### Amazon Simple Storage Service (S3)
Durable, scalable object storage
#### Features
Infinite scalability, greater analysis, and faster data retrieval.
- Highly scalable object storage with
- Object size: can be upto 5 TiB
- There is no limitation of how many files you can keep.
- 11 9s durability
- 4 9's availability

Common S3 use cases:
- backup and storage
- application hosting
- media hosting
- software delivery

#### S3 Classes / Varities:
- Standard
  Active Data
  Stores data in 3 AZ???
- Standard Infrequent Access
  Lower per gb price than standard. But it has per gb retrieval fee.
  Stores data in 3 AZs.
- One Zone
  Infrequent Access. Stores data in a single AZ.
  20% lower prices than Standard IA.
- Amazon S3 Glacier and Amazon Glacier Deep Archive (S3 Glacier Deep Archive)
  Secure, low-cost and durable storage classes for data archiving.
  Archive Data
- Amazon S3 Intelligent Tiering
  Automatic cost saings by moing data between two access tiers, configured by the customer.

#### Amazon S3 Glacier: Data archiving and backup
### Amazon Storage Gateway: Seamless and secure integration
### Amazon Elastic File System (EFS)
File Storage for Amazon EC2 Instance

## Database Services
### Summary
    Amazon RDS = Relational Database Service = MySQL, PostgreSQL, Oracle, Microsoft SQL
    Amazon Aurora = MySQL or PostgreSQL compatible, redundant, highly available, auto patched and backed up, 3 times the throughput of MySQL.
    DynamoDB = key-value database for simple lookup table.
    Redshift = for dataware housing purpose where BI (business intelligence) processes will run on the past data for analysis.
    DocumentDB = More than just key-value pair database. It's full-fledged database. NoSQL DB. Json Format. MongoDB compatible.
    Neptune = Graph Datbaase. (like neo4j?). Recommendiation engines. Fraud database.
    Amazon Quantum Ledger Database (QLDB) = for immutable data requried in banking sector.

### Features
Purpose-built for specific application use cases
Offlod time-consuming management tasks
### Types
#### Amazon RDS (Relational Database Service)
- It's called Amazon Aurora
- Managed Backup Service
- Automated backups
- Database point-in-time snapshots
- Cost-efficient and resizable capacity
- Automatic Host relpacement


#### 6 other types of databases support.d
1. Amazon Aurora
2. MariaDB
3. PostgreSql
4. Oracle Database
5. MSSQL Server
6. MySQL

#### Amazon DynamoDB
- NoSQL DB
- fast and predictable performance

#### Amazon ElastiCache
- in-memory caching system

#### Amazon Redshift
- Data warehousing and processing.
- Collecting data from multiple sources and analyze them.
- Generate report on past events
- Predict future

## Networking
### Amazon VPC
Build a virtual network in the cloud.
Networking layer for Amazon EC2
A virtual network dedicated to a customer's AWS account.
Subnet: A range of IP address in a VPC.
Public and Private Subnets

Flow Logs - Capture Network flow information
Host-based firewalls - OS firewalls

### Security Groups
Control Access to instances

### Network Access Control Lists (NACL)
Control traffic/access at the subnet level

### Amazon Route 53
Route end users to internet applications

## Security
### AWS IAM (Identity and Access management)
- Securely control access to AWS services and resources
  - Fine-grained access control to aws resources
  - multi-factor authentication
  - ability to analyze accesss
  - Integration with corporate directories

- Cloud security at aws is teh highes priority
  - Inherit benefits from AWS data center and network architecture

  - similar to on premises data cetners, without maintaining facilities and hardware.

  - can be easily automated

  - inherit all the best practicies of aws






### Shared Responsibility Model
- AWS
  AWS is responsible for the security *of* the Cloud
  - AWS global infrastructure
  - regions
  - availability zones
  - edge locations
  - compute
  - sotrage
  - database
  - networking
- Customer
  Customers and apn partners are responsible for the security *in* the cloud
  - Client side data encryption and data integrity authentication
  - Server-side encryption (file system and data)
  - Network traffice protection (encryption / integrity / identity)
  - Operating system, network, and firewall configuration
  - platform, applications, identity and access management
  - Customer Data

### Cloud Compliance

- Sharing Information
  - Inustry certifications
  - SEcurity and control practices
  - Compliance reports directly under NDA

- Assurance Programs
  - ICertiifcation and attestations
  - Laws, regulations, and privacy
  - alignments and frameworks
## Management
REST like API
AWS management console (GUI)
AWS cli
Software Development Kit (SDKs)

## Other solutions
Machine Learning
Analytics and Data Lakes
Internet of Things
Serverless Computing
Containers
Enterprise Applications
Storage
Windows Workloads



# From Service to Solution
## Migration
### Six R's
- rehost
  - lift and shift
  - recreating the on-premises network, only hosted on AWS.
  - automating with tools such as aws VM import/export
  - easier to optimize and re-architect applicaitons after migration.

- replatform
  - lift, tinker, and shift
  - Retaining the core architecture
  - making targeted aws cloud optimizations
  - examples:
    - migrating databases to amazon RDS
    - Migrating applications to amazon elastict beanstalk

- refactor
  - modernize
  - re-imagining how the application is architected and developed
  - Using cloud-native features : Turn monolithic application into containerized mini applications.

- retire
  - shutting off non-useful applications
  - reducing spend, manageemnt, and security

- retain/revisit
  - keeping certain application on-premises

- repurchase
  - moving workflows to software as a service (SaaS)

# Cloud architecture best practices
## design for failure and nohting fails
- avoid single points of failure
- multiple instances
- multiple AZs
- separate single server into multiple tiered application
- for amazon rds, use multi-az features

## build security in every layer
- encrypt data at rest and in transit
- enforce principle of least privilege in IAM
- implement both Security groups and netowkr access control lists (NACL)
- consider advanced security features and services
amazon inspector
amazon guard
aws shield

## leverage different storage options
- move static assets to amazon s3
- use amazon cloudfront to server globally
- store session state in dynamodb
- use elasticache between hosts and databases to store the database query results.

## implement elasticity
- implement auto scaling policies
- architect resiliency to reboot and relaunch
- leverage managed services like amazon s3 and amazon dynamodb

## think parallel
- scale horizontally, not vertically
- decouple compute from session / state
- use elastic load balancing
- right-size your infrastructure

## loose coupling sets you free
- looser the systems are coulped, the larger it can scale.
- instead of a single, ordered workflow, use multiple queues
- use amazon simple ueue service and simple notification service (SQS & SNS)som

## don't fear constraints

# Five Pillars
## Operational excellence
## Security
## Reliability
## Performance efficiency
## Cost optimizations
- Pay for what you *need*
- Right-sizing instances
- Increasing elasticity
- Chooing the right pricing model
- Optimizng storage

# Discovery
- Discover custormer requirements
  - Research customer's business
  - Determine market segment
  - Identify industry trends
  - Identify customer's competitors
  - Research recent news
  - Research customer relationsihp to AWS

- How to ask Questions
  - Ask targeted questions
  - Ask open-ended questions
  - Dive deeper
  - Uncover the real desired outcomes
  - Keep track of the conversation
  - Illustrate workflows and ideation

- Objection handling best practices
  - Data driven approach
  - Use case studies
  - Dive deep.
  - Have backbone
  - Keep the momentum going.

- Security
  - Security at AWS is our top priority
  - Higher security posture than in legacy environments
  - Customer inherit all the benefits of our experiencec.
  - Validated against the strictest of third-parti assurance frameworks.

- Cost or cost savings
  - reduce tco
  - achieve continuously optimized and predictable spned
  - no longer overprovision infrastructure for peak demand
  - GE Oil and Gas decreased TCO by 52%.

- Scalability and response
  - build cloud foundation team.
  - create gourd rails around security, availablity, reliability.
  - aws control tower gives maximum control -- with sacrificing speed and agility.

- Presentation
  - 1 hour presentation needs at least 3 hours preparation

- What NOT to do
  - Use words like definitely, never, or guaranteed.
  - use acronyms or technical jargon
  - focus on technology
  - focus on the short/mid-term
  - read the slides

# Implementation
## Migration
- Four phases of iterative migration process
  + Assessment
    - Identify readiness
    - Identify potential business outcome
  + Readiness and Planning
    - Analyze environment and find the dependencies.
    - Determine migration strategies
    - Create a well-architected landing zone
  + Migration
    - Design, migrate and validate each application
    - Automatic or manual
    - Migrate data
  + Operations and Optimizations
    - Operate
    - manage
    - Optimize
    - Improve operating model.
## Going to production
## Minimum Viable Product (MVP)
Avoid building a solution where you only discover if there is success at the end.
Instead, start with something basic and gather feedback as you get more complex.
## Well architected review

# Modernization
# Roles
## Classic IT Roles
### Architect
Responsible for desiging IT acrhitectures based on businesss requirements.
- Enterprise or System Architect
  Create Holistic IT architecture designs
- Application Architect
  Design applications
- Storage Architect
  Design Storage Infrastructure
- Network Architect
  Design Network Architecture
- Security Architect
  Specify Security Requirements
### System Adminsitrator
- Hardawre / Software
  install
  repair
  replace
  maintain
  monitor performance

- Computer Systems
  Support
  Maintain
  Monitor Network
  Manage Log Files
  service outage response

- OS and applications
  Install
  update
  patch

- File Systems
  Manage

- Enntire Environment
  Backup and Recover

- Users
  Manage users
  Access control

# Cloud Value Economics
## Cloud Benifits
   - Agility allows to avoid planning ahead of time for how much capacity I need.
   - 

## Cloud Value Framework
- Cost Savings (TCO)
  Tool: Cost Savings Analysis
  On Premises vs AWS
  Customer analysis might be wrong because customer might find getting all informaiton and putting it together is very hard.
  20% - 40% less cores on AWS

- Consumption-based Pricing Model
    Pay for what you consume.
    Better than overprovision or underprovision because they bring inefficiency leading to financial loss.

- AWS pricinng models
  - Test
    - on-demand
    - reserverd = reserved instances can reduce 75% cost than on-demand
    - Spot instances
    - Dedicated instances
    - Price reductions
    customer will automatically get the reduced price. No need to renew contract

Migration Cost Formula
ROI = (Cost Savings) / (Sunk Costs + Migration Costs)

- Sunk Costs
  Customer's hardware is fully depreciated, and the company is not close to a hardware refresh.
  and cannot sell the non-depreciated assets.

  Depreciation
  Was the asset's depreciation considered?

  Recovery Value
  Can any value be recovered by selling assets?


- Cost of migration and decommissioning
  Customer's existing data center is moved to cloud and data center is shutdown. It requires significant cost and effort.

- Staff Productivity
- Operational Resilience
- Business Agility

Customer Cost Saving Analysis Best Practices
1. Make sure you have the right stakeholders in the room to discuss the cost analysis (finance, procurement, IT support, engineering).
2. Work collaboratively with the customer.
3. Use realistic usage percentages (%).
4. Assign cost/value to business-value factors, such as agility and risk.

Avoid these practices
1. Focus puerly on pricing and discounts, rather than cost analysis.
2. Compare a duplicate of an on-premises environment - problematic apples-to-apples comparisons of machines
3. Allow all decisions and vision to be based on on an unchecked analysis -- One person should not analyze everything. A whole team must work on it to avoid failing to capture the true costs of IT, data center, and on-premises.
4. Bring up the cost savings discussion late in the decision-making process.


Works:
1. 3 to 5 year depreciation
2. 3 year reserved instances (RI) which is equivalent to purchased hardware which can't be refreshed in 3 years.
3. Use voluem RI discounts
4. Use volume RI discounts
5. Use realistic ratios
6. Use realistic ratios (VM density, servers, racks)
7. Explore on-premises CPU and memory usage.
8. Apply cost benefits of automation (automatic scaling, APIs, AWS Trusted Advisor, Cost Optimization)

What to Avoid / What does not work
1. Forget power/cooling (compute, storage, netwokr)
2. Forget adiminstration costs (procurement, design, build, operations, network, security)
3. Forget rent/real estate (building deprecation, taxes, shared service staff)
4. Forget software and hardware maintenance costs
5. Forget the cost of redundancy


Delivering cost savings
1. Kickoff
   - cost savings, overview
   - Timeline, scope, and roles
2.

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
```
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
```


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

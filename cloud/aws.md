# AWS Cloud Basics
## Characteristics of cloud computing
1. pay-as-you-go pricing
2. services are delivered over the internet.
3. on-demand delivery and available in seconds

## 6 advantages or  of using cloud computing
1. Go global in minutes: Going global in minutes means you can deploy applications in multiple Regions around the world.
2. Stop spending money running and maintaining data centers
3. Benefit from massive economies of scale.
4. Increase speed and agility: 
The cloud gives you increased speed and agility. All the services you have access to help you innovate faster, giving you speed to market.
5. Stop guessing capacity
6. Trade capital expenses for variable expenses

## 4 benefits of cloud in technical terms
1. High Availability : Highly available systems are designed to operate continousoly without failure for a long time. These systems avoid loss of service by reducing or managing failures.
2. Elasticity : With elasticity you don't have to plan ahead of time how much capacity you need. You can provision only what you need and then grow andshrink based on demand. With elasticity, the company doesn't have to plan ahead of time how much capacity they'll need - elasticity allows them to match the supply of resources with changing workload demands.
3. Agility : The colud gives you incresaed agility. All the services you have access to help you innovate faster, giving you speed to market i.e. innovate more quickly and deliver your applications faster.
4. Durability : Durability is all about long-term data protection. This means your data will remain intact without corruption.
5. Scalability: It means the systems can adapt to meet new levels of demand. It means a system has the ability to grow to accomodate an increase in demand. There are both horizontal and vertical scaling in regards to compute resources. Horizontal scaling involves the adding of instances of the same size. Vertical scaling is typically a manual process where the size of the instance is changed.

## 3 Common Cloud Computing Models
1. IaaS : Infrastucture as a service
2. PaaS : Platform as a Service
3. SaaS: Software as a Service

## 3 Common Cloud Deployment Models
1. Private Cloud
2. Public Cloud
3. Hybrid Coud

## Regions
What's a region?
- A Region is a geographical area of the world that is a collection of data centers logically grouped into Availability Zones.
- Each region consists of two or more AZs.
- Regions are completely independent and isolated from each other.
- Certain resources are tied to regions.
- Each region has a group of datacenters which is called availability zone.
- Each region has multiple, independent and physically isolated AZ.

## Availability Zones (AZs)
What's a availability zone?
- A group of multiple data centres close enough together to be grouped into one AZ.
- AZs are isolated from other AZs withing the region.
- Each data centre has redundant power, networking and connectivity.
- AZs are connected to each other with redundant, ultra-high-speed, low-latency connection within a region.
- AZs in a region are within 100kms or 60 miles.

### Edge Location
They are just endpoints for AWS thare used for caching content. This consists of AWS's content delivery network: CloudFront.

## Misc
- Web and mobile apps
- Data processing and warehousing
- Storage and Archiving

# AWS Core Technologies
## Compute
Compute means some form virtual machine which runs code.

### Amazon EC2 
Elastic Cloud Compute => EC2 
Capability to resize compute capacity

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

#### Amazon Machine Images (AMI)
Amazon machine imgase are like template virtual machines already created. Just need to select the CPU, memory, network, disk size. Then machine images will be deployed and the OS will be ready.

#### Pricing
##### Definition
- On-Demand
    - What is it?
        - fixed price
        - billed down to second based on instance type
        - no contract
        - pay only for what you use.
        - can reserve on-demand capacity.
    - When to use?
        - care about low cost.
        - no upfront payment
        - no long-term commitment
        - applications have unpredictable workloads that can't be interrupted.
        - applications are under development
        - workloads will not run longer than a year.

- Spot
    - What is it?
        - Use the unused EC2 capacity across AWS. 
        - the request is fulfilled only if capacity is available.
        - can save up to 90% off on-demand prices.
        - cheapest option
    - When is it to use?
        - Not concerned about the start and stop time of application
        - workloads can be interrupted.

- Reserved Instances (RIs)
    - What is it?
        - commit to a specific instance type in a particular region for 1 or 3 yeras.
        - can save up to 75% off on-demand prices
        - sign a contract
        - can reserver capacity in AZ for any duration.
        - can pay all upfront, partial upfront or no upfront.
        - all upfront for the max term earns the highest discount.
        - provides converible types at 54% discount.
    - When to use it?
        - applicaiton has steady state usage -> can commit to 1 or 3 years.
        - application requires capacity reservation.

- Dedicated hosts
    - What is it?
        - physical server that is fully dedicated to your running instances.
        - save up to 70% off on-demand prices
        - bring your existing per-socket, per-core, per-vm software licenses.
        - no multitenancy -> server is not share with other customers.
    - When to use it?
        - you can bring your own server-bound software license from vendor.
        - There is regulatory or corporate compliance requirements around tenancy model.

- Savings Plan
    - What is it?
        - commit to compute usage (measured per hour) for 1 or 3 years.
        - save up to 72% off on-demand prices
        - It's not making a commitmnet to a dedicated hsot.
        - It's not a capacity reservation.
        - Savings can be shared across various compute services.
    - When to use it?
        - Want to lower your bill across multiple compute services.
        - Want to the flexibility to change computer services, instance types, operating systems or regions


##### Question Answers
- A company with a business-critical application needs to ensure business continuity and that they will not be impacted by capacity restraints in a given Region. How can the company ensure this?
    - On-demand capacity reservation: On-Demand Capacity Reservations enable you to reserve compute capacity for your Amazon EC2 instances for any duration.
    - Standard Reserved Instance (RI) with a capacity reservation: A Reserved Instance is a reservation of resources and capacity for either 1 or 3 years. A capacity reservation offers assurance that the customer will be given preference if there is ever a capacity constraint in a Region.
    - Convertible Reserved Instance (RI) with a capacity reservation: A Reserved Instance is a reservation of resources and capacity for either 1 or 3 years. A capacity reservation offers assurance that the customer will be given preference if there is ever a capacity constraint in a Region.


### Elastic Beanstalk
Elastic Beanstalk, which is a provisioning engine => a way of basically automating the deployment of your applications within AWS.

### Amazon EC2 Auto Scaling: increase or decrease number of instances
- automatically add or remove instances to adapt to demand
- monitor the health of running instances
- replace impaired instances automatically
- balance capacity across availability zones
- dynamic and predictive scaling
- When you require scalable capacity to maintain service levels in your environment.  Auto Scaling monitors your applications and automatically adjusts capacity to maintain steady, predictable performance at the lowest possible cost.

### Elastic Load Balancing: Distribute incoming traffic
Automatically distribute incoming application traffic across multiple EC2 instances
Increase availability and fault tolerance
Configure health checks
Offload encryption and decrytion
Types:
    - Classic laod balancer
    - Application load balancer
    - Gateway load balancers
    - Network load balancer

#### Aplication Load Balancer
AWS recommends enabling multiple Availability Zones for all load balancers. With an Application Load Balancer however, it is a requirement that you enable at least two or more Availability Zones. This configuration helps ensure that the load balancer can continue to route traffic. If one Availability Zone becomes unavailable or has no healthy targets, the load balancer can route traffic to the healthy targets in another Availability Zone.
### EC2 Auto Scaling
- Horizontal Scaling
- Vertical Scaling

### AWS Lambda: Run code in response to events
- Lambda is a serverless compute service that lets you run code without managing servers.
- charged based on the duration and number of requests
- 1 million free requests each month.
- Lambda allows you to run a variable and intermittent code without paying for compute time when your code isn't running.

### Containers
#### AWS Fargate 
It is a serverless compute engine for containers like docker.

#### Amazon Elastic Containe Service (ECS)
Run applications on a managed cluster (docker)

#### Amazon Elastic Container Registry (ECR)
Store, manage, and deploy container images.

#### Elastic Kubernetes Service (EKS)
Fully managed Kubernetes service.

### Amazon Lightsail
An easy-to-use cloud platform to quickly launch pre-configured applications for small projects.

### Edge
- AWS Outposts - Run aws services on-premise - installs servers on-premises
- AWS Snow Family
- AWS Wavelength - Access aws services 5g networks
- VMWare Cloud on AWS - Migrate VMWare workloads
- AWS Local Zones - Run latency sensitive applications closer to end users.
AWS Batch - batch allows you to proces large workloads in smaller chunks



## Storage Service
A reliable, scalable, and secure place for data
EBS - Elastic Block Store = Block Disk
EFS - Elastic File Store = NFS Share
S3  = Simple Storage Service = Object Storage
FSx = ? #TODO

### Amazon Elastic Block Store (EBS):
Durable Persistent Block Level Storage
Replicate every EBS volume.
- Network-attached block storage for use with Amazon EC2 instance
  - Persist independently from instance
  - Tied to ove AZ.
  - Used like a physical hard drive
  - Automatically replicated
  - Attached to any instance in the same az
  - One EBS volume can belong to one EC2 instance
  - One EC2 instance can have many EBS volumes
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
- Set security at bucket level or individual access level.
- S3 has versioning feature to keep multiple versions.
- S3 access logs can be used to track issues or abnormal activities.
- S3 is a regional service. But the bucket names are global.
- provides automatic replication across Availability Zones.
- Bucket policies OR Bucket access policies
    - Bucket policies allow you to control access to entire buckets, whereas access control lists let you control access to individual objects within an S3 bucket.
    - By default, buckets and their contents are private. By default, all data stored in S3 is not viewable by the public. If you want a bucket or object to be accessible by the public, you must explicitly make it so. NAT gateways and internet gateways are needed to allow communications between VPCs and the internet, but they are not required when it comes to S3. 

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
- One Zone Infrequent Access
  Infrequent Access. Stores data in a single AZ.
  20% lower prices than Standard IA.
- S3 Glacier
  Secure, low-cost and durable storage classes for data archiving.
    - S3 Glacier Instant Retrieval
    - S3 Glacier Flexible Retrieval 
    - S3 Glacier Deep Archive
- S3 Outposts
    - provides object storage on-premises
    - a single storage class
    - stores data across multiple devices or servers

- Amazon S3 Intelligent Tiering
  Automatic cost saings by moing data between two access tiers, configured by the customer.

#### Amazon S3 Glacier: Data archiving and backup

### File Storage
- Amazon Elastic File System (EFS) -  Network File Storage for Amazon EC2 Instance
    - Only supports Linux FS.
    - Accessible from multiple AZ in the same region.
- Amazon FSx for Windows File Server

### Data Transfer
- Amazon Storage Gateway: provides on-premises access to unlimited cloud storage
- AWS DataSync - easily transfer data to and from AWS upto 10 times faster than normal
- AWS Transfer Family - Transfer files to S3 using SFTP, FTP and FTPS.


### Backup


### Storage Gateway
Provides on-premises access to unlimited cloud storage
- File Gateway - SMB and NFS interface to S3
- Tape Gateway - VTL on your local network
- Volume Gateway - iSCSI block storage volume to on-premises applications

## Database Services
### Types of Databases
- RDS = Relational Database Service
    - aurora - mysql and postgresql comptaible
    - redshift - cloud datawarehouse database.
- key-value - nosql
    - dynamodb - 
- in-memory
    - elasticache
    - memcached
- document
    - documentDB - mongoDB compatible

- graph
- time series
- wide column
- ledger


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
#### Amazon Aurora
- Managed Backup Service
- Automated backups
- Database point-in-time snapshots
- Cost-efficient and resizable capacity
- Automatic Host relpacement


#### 6 other types of RDS
1. Amazon Aurora
2. MariaDB
3. PostgreSql
4. Oracle Database
5. MSSQL Server
6. MySQL

#### Amazon DynamoDB
- NoSQL DB
- fast and predictable performance
- key-value document database
- single-digit ms performance
- fully managed
- works in multiple regions
- built-in security, backup and restore
- can handle more than 20,000,000 requsets  per second
- works great with serverless.
- works great for mobile application 
- provides automatic replication across Availability Zones.


#### Amazon ElastiCache
- in-memory caching systems / engines
- ElasticCache is a web service that makes it easy to deploy, operate, and scale and in-memory cache in the cloud.
- ElasticCache supports two opensouce in-memory caching engines
    - memcached
    - redis


#### Amazon Redshift
- Data warehousing and processing.
- Collecting data from multiple sources and analyze them.
- Generate report on past events
- Predict future
- Redshift allows you to run complex analytic queries against petabytes of structured data, use sophisticated query optimization, has columnar storage on high-performance local disks, and has massively parallel query execution?

### Additional Notes
RDS (OLTP)
SQL
MySQL
Oracle DB
PostGreSQL
Amazon Aurora
MariaDB
Amazon DynamoDB (No SQL)
Redshift OLAP - Amazon Data Warehouse Solution

Bootstrap script
For RDS
```
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
```



## Networking
### Bird's eye-view
- Cloud Networks
    - Amazon VPC - define and provision an isolated network for your aws resources
    - AWS transit gateway - connect VPCs and on-premises networks
    - AWS privatelink - provide private connectivity between VPCs and on-premises applications
    - Amazon Route 53 - host your own managed DNS.

- Network Scaling
    - Elastic load balancing - automatically distribute network traffice accross a pool of resources
    - aws global accelerator - direct traffic through the aws global network to improve global application performnace.

- Content Delivery
    - Amazon CloudFront - securely deliver data, videos and applications to customers globally with low latency and high transfer speeds.

### Amazon VPC
Build a virtual network in the cloud.
Networking layer for Amazon EC2
A virtual network dedicated to a customer's AWS account.
Subnet: A range of IP address in a VPC.
Public and Private Subnets

Flow Logs - Capture Network flow information
Host-based firewalls - OS firewalls

- Some components:
    - NAT gateway
    - internet gateway
    - network access control list

- By default, all subnets within a VPC can communicate with each other.

### Security Groups
Control Access to instances

### Network Access Control Lists (NACL)
Control traffic/access at the subnet level
### CloudFront
Just like ElastiCache works between application and database to cache the data of database and to get faster response, CloudFront works in Edge location between user and website/application to cache the images, videos or other static data.

[User] <--> CloudFront <--> [Application]

### Amazon Route 53
DNS service
Route end users to internet applications
- Routing policy
    - simple routing
    - weighted routing policy
    - geolocation policy
    - latency policy
    - failover policy
    - multivalue answer policy

### Direct Connect
Direct Connect is a private (bypasses the public internet), dedicated physical network connection from your on-premises data center to AWS. Since the connection is private, it is extremely fast.

### API gatewoy 
It's a serverless way of replacing web servers

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


- the best way to give S3 access to all applications running on the EC2 instance -> Use an instance profile to pass an IAM role with Amazon S3 permissions to the EC2 instance



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
  - Overall software of virtualization


- Customer
  Customers and apn partners are responsible for the security *in* the cloud
  - Client side data encryption and data integrity authentication
  - Server-side encryption (file system and data)
  - Network traffice protection (encryption / integrity / identity)
  - Operating system, network, and firewall configuration
  - platform, applications, identity and access management
  - Customer Data


Encryption is a shared responsibility between AWS and customers.


### Cloud Compliance

- Sharing Information
  - Inustry certifications
  - SEcurity and control practices
  - Compliance reports directly under NDA

- Assurance Programs
  - ICertiifcation and attestations
  - Laws, regulations, and privacy
  - alignments and frameworks
### Others
Later I will organize the below:

#### Data Protection
- Amazon Macie - Macie uses machine learning to discover sensitive data stored on Amazon S3. Macie automatically detects a large and growing list of sensitive data types, including personally identifiable information (PII) such as names, addresses, and credit card numbers.
- AWS Key Management Service - Store and manage encryption keys
- AWS CloudHSM - Hardware based key storage
- AWS Certificate Manager - provision, manage and deploy SSL and TLS security certificates
- AWS Secrets Manager
  - protects the secrets required to access the resources.
  - rotates automatically, manage and retrive secrets.
  - stores passwords, keys and tokens


#### Infrastructure Protection
- AWS shield - It's a managed Denial of Service protection service.
    - Shield Standard protects against layer 3 and 4 attacks.
    - Shield Advanced protects against layer 3, 4 and 7 attacks.
- AWS Web application Firewall (WAF) - filter malicious website traffics. It protects web applications against common web attacks like SQL injection attacks and cross-site scripting.
- aws firewall manager - Centrally manage firewall rules.

#### Threat detection
- amazon guard duty - automatically detect threats
- amazon inspector - analyze application security, Inspector works with EC2 instances to uncover and report vulnerabilities.
- aws config - record and evaluation configuratinos of your AWS resources. Config allows you to assess, audit, and evaluate the configurations of your resources over time. Config works with EC2 instances, servers running on-premises, and servers and VMs in environments provided by other cloud providers.
- aws cloudtrail - track user activity and API usage.

#### Identity management
- aws iam - securely manage access to AWS account services and resources.
  - iam users
    root user
  - iam policy
  - iam role: both service and user can assume a role to get particular privilege/permission to perform a task. For example, The company will need to create a role that grants access to S3 and associate it with the EC2 instance.
- aws single sign-on / IAM Identity Centre - Implement cloud  single sign-on
- Amazon Cognito - Manage identity inside applications.
- aws directory service
  - Implement and manage Microsoft AD.
  - Managed Microsoft AD
  - Managed Simple AD
  - AD connector - allow on pemise users to login to aws applications with AD
  - distributed service with automatic failover
  - compatible with other aws services
  - aws organizations - centrally govern and manage multiple aws accounts in one place.

- Service control policies (SCPs)
     - AWS Organizations provides central governance and management for multiple accounts. 
     - Organization SCPs allow you to create permissions guardrails that apply to all accounts within a given organization. 


- AWS Organizations
#### Management and governance
  - Account management services
    - AWS control tower - set up and govern a secure multi-account aws environment. It helps to ensure all AWS accounts to conform to company-wide policies.
    - Service control policies (SCPs) - AWS Organizations provides central governance and management for multiple accounts. Organization SCPs allow you to create permissions guardrails that apply to all accounts within a given organization
    - AWS organization - Centrally govern and manage your environments across multiple aws accounts.
    - aws budgets - improve your planning and cost control.
  - Provisioning Services
    - aws cloudformation - model and provision all your resources via code.
      - Templates
      - json or yaml settings.
      - specify all the configuration to the cloudformation. It will generate the full infrastructure
      - Full infrastructure with version control systems
      - Nesting templates
      - automation devops engineer can use it for automaiton
      - scale
    - aws service catalog - create, organize and govern your own curated catalog of AWS products
    - aws ops works - automate operations with Chef and Puppet
    - aws marketplace - find, test, buy and deploy software that runs on AWS.
  - Operation services
    - amazon cloudwatch - observe your services via metrics and logging
      - A CloudWatch alarm can be set up to monitor CPU utilization and trigger further action. Further action could be an Auto Scaling group adding another EC2 instance and/or using SNS to notify team members of the occurrence.
      - CloudWatch Alarms can be used to determine the percentage of utilization versus the limit.
      - monitoring
      - collect metrics from services
      - integrates with 70+ aws services
      - lots of pre-defined metrics
      - log storage
      - ssh login logs -> cloudwatch logs -> cloudwatch filter -> cloudwatch alarm
    - aws config - record and evaluate configurations of aws resources
    - aws cloudtrail - track all user and API activity across your aws accounts
    - aws systems manager - optimize performance and security while managing a large amonut of systems
    - amazon x-ray - analyze and debug production applications
    - autoscaling
      - minimum size
      - desired size
      - scale out to the maximum
      - high availability
      - better fault tolerance
      - better cost management
      - ec2, dynamodb, aurora

####  AWS Trust & Safety team
The customer should contact the AWS Trust & Safety team using the form or email if they found that there is mining happening in their EC2 machines.

#### DDoS attack protection
Use the following services:
- AWS Shield
- CloudFront
- Web Application Firewall (WAF)
- Route 53

#### Questions
- Customer Service Policy for Penetration Testing: 
AWS customers are welcome to carry out security assessments or penetration tests against their AWS infrastructure without prior approval for Amazon EC2 instances, NAT gateways, elastic load balancers, and 7 other services.

## Machine Learning
  - Amazon Kendra - intelligent search
  - Amazon Personalize - personalized recommendation


Machine learning tools for business metrics
  - Lookout for Metrics - detect unexpected changes eg revenue performance or customer retentino, and identify root causes
  - Forecast - build accurate forecasting models
  - Fraud Detector - identify potentially fraudulent online activities.

  Rekognition - Analyze images, object and scene detection and extract meaning

Polly - turn text into life-like speech.
Transcribe - turn high quality speech to text. add this capability to your applications.
Lex - easily build conversational agents or chat bots.




## Management
REST like API
AWS management console (GUI)
AWS cli
Software Development Kit (SDKs)

### AWS Trusted Advisor
Q: Which AWS service can help you optimize your AWS environment by giving recommendations to reduce cost, increase performance, and improve security?
A: Trusted Advisor provides real-time guidance to help you provision your resources following AWS best practices.
- Exposed access keys
- Open-access permissions for S3 buckets
- low utilization on EC2 instances.
- Trusted Advisor has a service limit dashboard that helps you monitor service limits.



### AWS Personal Health Dashboard
The AWS Personal Health Dashboard publishes alerts and remediation guidance when issues with AWS services arise. Notifications are also provided for scheduled events that may impact AWS customers.

## Other solutions
Machine Learning
Analytics and Data Lakes
Internet of Things
Serverless Computing
Containers
Enterprise Applications
Storage
Windows Workloads


# Billing and Pricing

## Support Matrix
Here is a brief description what each support level provides

### Developer Support
- Open a technical support case via email. Customers on the Developer Support plan can submit support cases for account and billing questions, service limit increases, and technical support cases via email only.

### Business Support
- Business Support is the minimum plan that provides access to the full set of Trusted Advisor checks.
- The Business level support plan provides 1 hour or less response time support for production-level failures.
- Infrastructure Event Management is also available to Business Support customers, but they need to pay an additional fee to use this service and cannot use it normally as part of their plan.
- 24x7 support via phone or chat.

### Enterprise Support 
- All of Business support.
- It provides access to a Technical Account Manager (TAM) who helps coordinate access to subject matter experts among other things. TAMs typically provide proactive best-practice guidance and assistance with architecting, developing, and running AWS solutions.
- Customers on the Enterprise Support plan have access to the AWS Support API to create, manage, and close support cases.
- The Concierge agent is the primary point of contact for billing or account inquiries
- The response time for a business-critical system down case is less than 15 minutes.
- AWS Infrastructure Event Management is a structured program available to Enterprise Support customers that helps you plan for large-scale events, such as product or application launches, infrastructure migrations, and marketing events. It is also available to Business Support customers, but they need to pay an additional fee to use this service and cannot use it normally as part of their plan. 



## All about cost
### AWS Pricing Calculator
The Pricing Calculator provides an estimate of AWS fees and charges. Since the company knows the workload details, the AWS Pricing Calculator can also help with calculating the total cost of ownership.

### AWS Cost Explorer
Cost Explorer allows you to visualize and forecast your costs and usage over time

### AWS Cost and Usage Report
AWS Cost and Usage Report to track your EC2 Reserved Instance costs.

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

# AWS SIX Pillars - 
It's found in AWS Well-Architected Framework Whitepaper

## Operational excellence
- Deploy smaller, reversible changes.
- Plan for and anticipate failure.
- Script operations with code.

## Security
- Assign least privileges that is required.

## Reliability
- Scale horizontally for resilience
- Automatic recovery from failure

## Performance efficiency
- Serverless architecture first
- Use multi-regional deployment.
- Effective use of resources to meet demand.
- In this pillar, you would use the information gathered through the evaluation process to actively drive adoption of new services or resources. You would also define a process to improve workload performance, and you would need to stay up-to-date on new resources and services.

## Cost optimizations
- Pay for what you *need*
- Right-sizing instances
- Increasing elasticity
- Choosing the right pricing model
- Optimizng storage

## Sustainability

# From Service to Solution
## Discovery
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
    - Migrating applications to amazon elastic beanstalk

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

## Implementation
### Migration
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
### Going to production
### Minimum Viable Product (MVP)
Avoid building a solution where you only discover if there is success at the end.
Instead, start with something basic and gather feedback as you get more complex.
### AWS Application Discovery Service
AWS Application Discovery Service helps you gather information about your on-premises environment and is considered a migration tool.



## Modernization
Modernizing the legacy application by re-architecting and hosting the application in the cloud.
## Roles
### Classic IT Roles
#### Architect
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
#### System Adminsitrator
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

# Cloud Value Economics - Cost Optimization
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
    - Spot instances - 90% off the normal price. The workloads have to be fault tolerant.
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


# Documents to Read
AWS Documentation
Guides and API references: https://docs.aws.amazon.com/index.html

Blogs to read

Perspectives: https://perspectives.mvdirona.com/
All Things Distributed: https://www.allthingsdistributed.com/

## From snapshot -> Create volume
Can be changed:
volume type
volume size
availability zone
encryption

## From snapshot -> Create snapshot
Can be changed:
Region
Encryption






# Habijabi
## Elastic File System (EFS)
```
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
```

## aws cli
To attach a gateway with VPC
`aws ec2 attach-internet-gateway --vpc-id "vpc-0814b4de9f8f93524" --internet-gateway-id "igw-09d552c517992113d" --region us-east-1`



# Notes from a youtube course
AWS Certified Cloud Practitioner Certification Course (CLF-C01) - Pass the Exam!
Link: https://www.youtube.com/watch?v=SOTamWNgDKc&t=3366s



# Peijun Wu - Notes from Internet
3 months ago (edited)
Tracking my progress: 12:27:30
Notes:
1. Allocate 120 minutes. Actual exam is 90 minutes.
2. 50 scored questions and 15 unscored (too hard / too easy / unseen)
3. Always create IAM user instead of using root account. IAM user common policies are Admin, PowerUsers, etc
4. General computing : EC2. GPU Computing : Infer1. (compete against tpu in gcp). Quantum: AWS Bracket.
5. Data centers within a region are isolate from each other (different buildings), but close enough to provide low latency (less than 10ms), therefore they usually have the same impact, and HA is defined as being available in 2/3 different AZs. Subnets are associated with AZs. You pick subnets instead of picking AZs for EC2, for instance. Default subnets are created one subnet per AZ. Managed HA services will replicate in multiple AZs behind the scene in each region so you don't need to pick (e.g., S3.). CloudFront distribution uses "area" which covers many regions. Global services like IAM doesn't even have concept of region.
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
4. AWS Config: Policy as Code service. You can create rules that continuously check AWS resource configuration. If they deviate (someone accidentally deploy to a wrong region), you can get alerted / the service can auto-fix the deviation.
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
```
arn:<partition>:<service>:<region>:<account-id>:<resource-id>
arn:partition:service:region:account-id:resource-type/resource-id
arn:partition:service:region:account-id:resource-type:resource-id
```

where partition can be aws, aws-cn, aws-us-gov.

Since ARN address is hierarchical, you can use * to specify a group of resources in policies, etc: arn:partition:service:region:account-id:*

IaC (Infrastructure as Code) helps in Automation.
CloudFormation (CFN): JSON/YAML, declarative, can be huge and not as dynamic (hard to create repeated infra). The infra CFN creates is called stack.
CDK: Imperative, web programming language e.g., Python, can be more dynamic, generates CFN. Easier to create CICD pipelines than CFN. AWS CDK vs. AWS SDK? AWS CDK ensures idempotence of your infrastructure.
CDK constructs: reusable cloud components. constructs.dev (similar to Terraform modules).

EC2: virtual machines. "instance".
AMI: predefined configuration for EC2 - amount of CPU, amount of memory, network bandwidth, OS, storage options such as EBS.
EC2 is considered the backbone of AWS as many services use EC2 as underlying servers -- S3, RDS, DDB, Lambdas, etc


# Links to Read
- https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html
- 

# Links to read
- AWS Directory Service Documnetation: https://docs.aws.amazon.com/directory-service/index.html
- AWS IAM Service Documentation
- S3 storage types : https://aws.amazon.com/s3/storage-classes/
- 


# AWS Cost Optimization
## Five Best Practices
- Practice Cloud Financial Management
- Expenditure and Usage Awareness
- Cost Effective Resources
- Manage Demand and Supply Resources
- Optimizing over Time.

# AWS Exam Guide
Design Secure Architectures,
Design Resilient Architectures,
Design High-Performing Architectures, and
Design Cost-Optimized Architectures.

 Cost Optimization

# 5 Design Principles

## Practice Cloud Financial Mgmt.

### Cost awareness

#### Understand your use cases

##### Do data need to be encrypted?

##### Do data need to be kept separate from other data?

##### Can data go through public internet?

##### What are storage, cpu and memory requirements?

##### Do you need frequent or not so often access to data?

#### Set up processes

##### Changes

##### Training

##### Make people trained to report and notify

##### Monitor the processes

#### Set up culture

##### Set up cost awareness programs

###### Rewards to the person who can reduce the most cost

###### Gamify it with scavenger hunt program

### Ownership: Form a team to own cost optimization iniatives.

### Partnership between Technology and Finance teams

### Staying in the know

#### AWS News Blog

#### AWS What's New Page in Email

#### AWS This Week in ACG YT Channel

### Budgets and Reporting Costs

#### Cost and Usage Report (CUR)

##### Comprehensive Information

##### Leverage usage with analytics services (Athena)

##### Pricing information and Usage

###### Services

###### Pricing

###### Credits

###### Fees

###### Taxes

###### Discounts

###### Savings Plan

###### Cost categories

###### Reserved Instances

##### It's a Report. Not a service. Found in billing console.

#### Application Cost Profiler

#### Budgets

##### Take actions accordingly.

##### Set custom budgets

###### cost

###### usage

###### savings plan

###### reservation budgets

##### Alert Notifications

###### Actual or Forecasted

###### Cost or usage threshold

###### daily, weekly or monthly budget reports

##### Granular Time Periods

###### Annual

###### Monthly

###### Weekly

###### Daily

#### Cost Explorer

##### user friendly service that allows to visualize
and manage cost and usage over time.

##### Custom time periods and granularity
from monthly to daily.

##### filter or group your cost and usage data

##### forecast future cost and usage.

### Quantifying Business Value

#### Use best practices

##### utilize the best resources

###### increase efficiency

###### cut costs to release funds

###### Find optimal cost as per your use case

* Host your website in EC2 if website is dynamic

* Host your website in S3 if website contents are static.

##### principle of least privilege

###### use groups and roles to segregate the access and privilege to resources.

##### monitor all resources

###### use dashboard

###### use cloudwatch agent to monitor and see metrics on dashboard

##### collect and analyze metrics:
workload, usage & cost

###### to constantly be aware of workloads and cost

###### then take action accordingly

##### use pattern

###### use cloud correctly

###### check if there is any underutilized resources

###### if something works optimally, then duplicate that pattern/architecture

#### Automation

##### Cut back manual work

##### Free up team to focus on more important tasks

#### Forecasting

##### Current cost and future cost

##### Set expectation

##### Improve predictability

## Expenditure and Usage Awareness
- Using Organizations, IAM, and Control Tower
  - AWS organization
    - define and manage mulitple accounts
    - control access permissions andaudit
    - activate single singn on
    - activate SCP 
    - Use audit log
    - manage billing and share resources across accounts
    - consoladed billing 
    - scp can control access resources, services and regions
    - manage mulitple accounts

  - iam
    - control access access aws
    - users, grou.s, roles and policies
    - principle of least privilege
    - iam roles to dolegate access to users or aws services -> short-term credentials for users/workloads/services
    - iam policies specify which permissions are included in policies that can be attached to roles.
    - iam access analyzer to check and verify permissions as I set them.

  - Control Tower
    - Landing zone with guardrails.
      - preventive
      - detective
      - mandatory
      - optional

- Using Tags to Monitor and Maintain costs
  - Best practice is to activate tagging in billing and management console and configure in such a way that you must assign pre-configured tags when you want to create a resource. Otherwise, the resoruce creation will fail.
  - using organizations tag policies - enable all features in organizations to utilize this feature.
  - cost allocation tags (tags that are used to organize your resources and create detailed cost and billing reports.)
  - Some useful tags you should configure
    - date configured (user defined; need to be activated)
    - created by (aws generated; must be enabled)




- QuickSight, S3 Storage Lens, Analytics, and Cost Categories
  - QuickSight
    - create and share dashboards that scale
    - everyone can view dashboards
    - self-service BI with QuickSight Q
    - embedded analytics for applications
    - ML insights
    - 10s of thousands can use simultaneously
    - SPICE -> Super-fast Parallel In-memory Calculation Engine
  - S3 Storage Lens
  - Analytics
  - Cost Categories
- Auto Scaling and instance scheduler

### Governance
    - Use them to bring structure

##### Policies

##### Groups

##### Organization

#### Reduce access to resources

### Monitoring

#### Resource Usage

#### Cost

### Decomission Regularly
    - Stay aware of resource lifecycle
    - Decommission less user or deprecated resources.

## Cost-Effective Resources

### Select correct services to meet your needs as per your use cases.

### Select correct type, size and number

### Select best pricing model

### Plan for data transfers

## Managing Demand and Supplying Resources

### Research

#### Analyze workload

#### Undersand use caess

#### Find if resources need to be demand-based, time-based or dynamic.

### Ensure resources are dynamic

### Use scaling, queues, throttling or buffers.

### Eliminate costly or wasteful over-provisioning

## Optimize Over Time

### Use updated features or new services from AWS to optimize cost.

# What is it?

## Continuous optimization of your spending to manage cost and allow budgets for growth.

# Why is it Important?

## Ensure over-spending does not occur

## Ensure cost allows for growth

## Maintain demand and supply of resources in cost optimized way.

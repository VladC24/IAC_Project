# IAC_Project
An IAC solution for deploying a scalable web application stack consisting of containerised components, using the following technologies:
- Node.js
- Express
- Terraform
- Kubernetes
- AWS
- Jenkins
- ELK stack
- Prometheus

## Project
1. **_Web Server:_** Containerised HTTP Server (Node.js)
2. **_Database Server:_** Containerised MySQL 
3. **_Application Server:_** Containerised lightweight Python application

## Requirements:
- Use Git for version control
- Utilise Kubernetes for managing the containerised infrastructure.
- Implement infrastructure provisioning using AWS and Terraform.
- The solution should be modular, scalable, and easily configurable for different levels of load and traffic.
- Include appropriate security measures in your containerized infrastructure setup.
- Implement auto-scaling capabilities for handling increased demand on the web application.
- Use best practices for containerisation, including Dockerfile optimization and container image management.
- Ensure proper networking setup for communication between containers and external traffic.
- Use Infrastructure as Code principles for managing container configurations and deployments.

## Deliverables:
- Infrastructure as Code scripts or configuration files for provisioning the containerized web application stack.
- README.md file providing instructions on how to:
    1. Set up and configure the containerized infrastructure.
    2. Deploy the containerized web application stack.
    3. Any additional considerations or notes related to containerization and scalability.
- Implement a CI/CD pipeline for automated testing, building, and deploying the containerized web application stack - Jenkins.
- Integrate logging and monitoring solutions specifically tailored for containerized environments - Prometheus, ELK
- Utilize container registry services for managing container images.
- Implement blue-green or canary deployment strategies for rolling out updates.

## WHAT I HAVE DONE SO FAR:

Currently, I have only managed to create the following:
1. AWS infrastructure (architecture diagram in /images folder)
    A. VPC
        - region: eu-west-2
        - 2 x Availability Zones
        - 2 x public subnets
        - 2 x private subnets
        - 2 x NAT Gateways with Elastic IPs - one in each public subnet for the resources in the private subnet to be able to access the internet
        - 1 x Internet Gateway
    B. EKS
        - 1 x EKS cluster spanning both AZs
        - 1 x node group with 1 x EC2 instance t2.micro
        - 2 x IAM roles - one for the node group and one for the cluster
        - 1 x security group for the node group
    C. RDS
        - 1 x instance db.t3.micro in 2 x private_subnets
        - 1 x security group
        - EKS ingress rules for db traffic

2. Web-server
    - a simple web server created with Express
    - contains one endpoint /getData which connects to the application server to extract data from the database
    - Dockerfile

3. Application server
    - a simple backed service created with Node.js
    - contains the db configuration, runs a select query when the /getData endpoint is called - *still needs a bit of work*
    - Dockerfile

## FUTURE WORK:
    If I had 2-3 more days, I would have been able to:
    - Create an S3 bucket to save the tfstate files every time I make an upgrade or change something in terraform. 
    - Create ECR for pushing the Docker images from the web and application servers
    - Containerise the two services and deploy them to EKS using Kubernetes
        - Deployment
        - Service
        - ConfigMap
    - Create Jenkins pipeline to automate:
        - push and pull images to ECR
        - implement vulnerability scanning on all Docker images
        - build components and version the builds.
        - deploy components
    - Implement filebeat to send logs to Logstash and visualize them in Kibana
    - Implement Prometheus rules to monitor all resources

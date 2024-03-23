# IAC_Project
An IAC solution for deploying a scalable web application stack consisting of containerised components, using the following technologies:
- Node.js
- Python
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

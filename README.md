# Cloud Security Capstone Projects

![Cloud Security](https://img.shields.io/badge/Cloud-Security-blue?style=flat-square) ![PCI-DSS Compliance](https://img.shields.io/badge/NodeJS-v18+-blueviolet?style=flat-square) ![HIPAA Compliance](https://img.shields.io/badge/OpenJDK-v17+-red?style=flat-square)

This repository hosts key components and procedures from my Cloud Security capstone projects, which include a HIPAA-compliant application deployed on Google Cloud Platform (GCP) and a PCI-DSS-compliant application deployed on Microsoft Azure. The repository serves as a reference for the work I have done and is intended for recruiters, colleagues, and anyone interested in understanding the technical implementation of these compliance-focused projects.

## Projects Overview

### 1\. HIPAA-Compliant Application on GCP

- **Objective**: Ensure compliance with HIPAA standards for protecting healthcare data.
- **Architecture**: Deployed using a 3-tier architecture.
- **Key Components**:
  - **Frontend and Backend Subnets**: Separated into different Virtual Private Clouds (VPCs) to enhance security.
  - **Database**: Managed MySQL instance with VPC peering to ensure secure data flow.
  - **Security**: Firewalls, secure access, and data encryption to protect sensitive information.

### 2\. PCI-DSS-Compliant Application on Azure

- **Objective**: Ensure compliance with PCI-DSS standards to secure payment information.
- **Architecture**: Multi-layered setup with stringent security measures.
- **Key Components**:
  - **Networking**: Virtual Networks (VNets) with subnet isolation for critical components.
  - **Security**: Network Security Groups (NSGs), encryption, and Identity and Access Management (IAM) policies to secure data and control access.

## Key Features

- **Automated Infrastructure Deployment**: Bash scripts for provisioning Virtual Machines (VMs) in both GCP and Azure environments.
- **Compliance-Driven Configurations**: Secure configurations tailored to meet compliance requirements, focusing on data protection, encryption, and secure access controls.

## Required 3 safeguards of the HIPAA Security Rule

- 1. Physical safeguards for ePHI
- 2. Technical safeguards for ePHI
- 3. Administrative safeguards for ePHI

## Repository Structure

```
.
├── HIPAA-GCP
│   ├── provisioning-scripts
│   │   ├── vm-setup.sh                 # Script for VM provisioning and setup on GCP
│   │   ├── firewall-config.sh          # Script to configure firewalls for secure access
│   └── app
│       ├── src                         # Source code of the deployed healthcare application
│       └── README.md                   # Documentation specific to the HIPAA project
│
├── PCI-DSS-Azure
│   ├── provisioning-scripts
│   │   ├── vm-setup.sh                 # Script for VM provisioning and setup on Azure
│   │   ├── security-config.sh          # Script to enforce security measures
│   └── app
│       ├── src                         # Source code of the deployed payment application
│       └── README.md                   # Documentation specific to the PCI-DSS project
│
└── README.md                           # General documentation for the repository
```

## How to Use

1.  **Provisioning Scripts**: Located in the `provisioning-scripts` folder under each project directory, these Bash scripts automate the setup of virtual machines and security configurations.
2.  **Application Source Code**: Available under the `app/src` directories, providing the actual codebase of the deployed applications.

## Getting Started

- Create VPCs
  - Add necessary subnets
- Provision virtual machines:
  - ssh into virtual machine instance
- Create deployment script file
  - nano script_name.sh
  - Copy and paste corresponding script from well named folders and save
  - Make script executable and run the script
- Edit configuration files
- Start the application

## Important Notes

- **Sensitive Information**: Ensure to replace any sensitive data or keys in the scripts with appropriate placeholders before use.
- **Compliance**: Configurations are tailored to meet specific compliance requirements; review and adapt according to your specific needs.

## Contact

Feel free to reach out if you have any questions or need further clarification about these projects.

- **Name**: Jeremiah Onwoh
- **Email**: jerryben@oracodeltd.com
- **LinkedIn**: [My LinkedIn Profile](https://www.linkedin.com/in/jerrybenoc)

---

**Disclaimer**: The configurations and scripts provided in this repository are meant for educational and reference purposes. Ensure you review and modify them to fit your specific compliance and security needs before deploying in a production environment.

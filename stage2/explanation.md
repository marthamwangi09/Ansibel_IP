## Stage 2
At this stage the playbook sets up and configures resources using Terraform for infrastructure provisioning and Docker for container management. It initializes Terraform, waits for server initialization, refreshes the host file, and then configures Docker and runs containers on the target host.

The Ansible playbook file contains a series of tasks that automate the provisioning and configuration of resources using Terraform and Docker. Let's break it down section by section:

#### Provision and configure resources:

- The playbook is executed on the local machine ("localhost").
The first task initializes Terraform using the `community.general.terraform module.` It specifies the project path as `{{ playbook_dir }}/terraform` which is the directory where the playbook is located and sets the state to `present` ensures Terraform is installed.
- The second task pauses the playbook execution for 4 minutes using the `pause module`. This is to allow time for the server to complete initializing before proceeding.

##### `Terraform scripts`
- `var.tf`
This is a Terraform configuration file that defines variables. Variables in Terraform allow you to parameterize your infrastructure code and make it more flexible and reusable.
There are 3 varribles defined:
    - `access_key` -  This variable represents an access key created on AWS. An access key is a unique identifier used for authentication and authorization to access AWS resources through APIs.
    - `secret_key` - This variable represents a secret key that corresponds to the access key ID mentioned earlier. It is a private key used for authentication purposes.
    - `public_key` - This variable refers to an SSH public key. It is used for SSH key pairs created on the control node and will enable SSH access to the newly created hosts.

    These variables are specifically related to the authentication and authorization mechanisms used in AWS.
    
- `providers.tf`
Sets up the AWS provider with specific settings. It configures the "aws" provider for the "eu-north-1" region and includes the access key and secret key for authentication. With these credentials, Terraform can interact with the AWS API and enable you to define and manage AWS resources.

- `main.tf`
Defines and provisions AWS resources. It define thsese parameters: an `AWS key pair`, setting up a `security group` with specific rules for inbound and outbound traffic, and launching an EC2 instance using a specified `Amazon Machine Image (AMI)` and `instance type. Additionally`, it updates the /etc/ansible/hosts file on the Ansible control node to include the newly created EC2 instance as a host.

- `terraform.tfvars`
This file follows the structure provided in the `terraform.tfvars.example` file. It serves the purpose of defining variable values for your infrastructure configuration. In this case, it includes variables such as `access_key`, `secret_key`, and `public_key`. It's important to note that this file is excluded from being pushed to git to prevent any potential exposure of sensitive information.

#### Reload host file:
This section is a separate play with the same "localhost" host. It is used to refresh the inventory after the server has finished initializing.

#### Configure Docker and run containers:
This play targets a host named "host1", which should be defined in the inventory. This should  be adjusted accordingly to in refenece to the host that has been set up in terraform main script.

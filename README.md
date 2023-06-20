# Ansible_IP
The project involves implementing Ansible configuration playbooks that automate the process of provisioning, configuring resources, and deploying an application. The project is divided into two stages.
- ##### Stage 1 `/stage1`
- ##### Stage 2 `/stage2`

## Stage 1: Ansible Instrumentation
The project uses Ansible playbook for Docker configuration on the designated hosts. It also handles the installation of required client and backend component images, as well as the running of containers. 
The playbook used two roles, namely `docker-install` and `docker-run` which handle the specific tasks. Find more eplainaton on `stage1/explanation.md`
## Stage 2: Ansible + Terraform instrumentation
In this stage the project uses an Ansible playbook to automate the process of infrastructure provisioning using `Terraform` and application configuration using `ansible roles`. This includes initializing Terraform, waiting for server initialization, refreshing the host inventory, and configuring Docker along with deploying containers on the designated host Find more eplainaton on `stage2/explanation.md`

## Stage 1
At this stage the playbook to configures Docker and runs containers on the specified target hosts. Let's break down the playbook step by step:

`Configure Docker and run containers`

This is the name given to the playbook for identification purposes. It serves as a description of the playbook's purpose.
- `hosts`: `all` indicates that the tasks in this playbook will be executed on all hosts specified in the inventory file. You can update it to target specific hosts by specifying their names or group names in this case in `/etc/ansibel/hosts` file
- `gather_facts`: false disables the gathering of facts about the target hosts. Gathering facts is the process of collecting information about the remote systems, such as IP addresses, hostnames, operating system details, etc. By setting it to "false," the playbook will skip this step.
- `vars` section defines variables that will be used throughout the playbook.
    - `client_image` is a variable that stores the name and version of the Docker image for the client component.
    - `backend_image` is a variable that stores the name and version of the Docker image for the backend component.
    - `app_folder` is a variable that defines the directory path where the application files will be stored.

`Roles`:
- `docker-install` is a custom role that is responsible for installing Docker on the target hosts. Roles are reusable and modular units of code that encapsulate a specific set of tasks.
- `docker-run` is another custom role that handles running Docker containers with the specified images and configurations.
The playbook essentially follows the following workflow:

In general at this stage the playbook `docker-playbook.yml` sets up the required variables. It executes the `docker-install` role to install Docker on the target hosts. It then executes the `docker-run` role using the `docker-compose.yml` to run Docker containers using the specified images and configurations.

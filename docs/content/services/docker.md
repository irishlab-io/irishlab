---
date: 2017-10-19T15:26:15Z
lastmod: 2019-10-26T15:26:15Z
publishdate: 2018-11-23T15:26:15Z
draft: false

title: "Setup Docker"
description: ""
author:
  - irish1986

weight: 1
---

Docker is an open-source platform that allows developers to package applications into containers, which are standardized, executable packages containing everything the application needs to run, including code, runtime environment, libraries, and system tools. This enables developers to build, deploy, and manage applications in a consistent and portable manner.
Here's a more detailed breakdown:

* Containers:
  * Docker uses containers, which are lightweight, standalone, and self-contained environments that isolate applications and their dependencies.
* Docker Engine:
  * The core of Docker is the Docker Engine, a client-server application that manages the containers.
* Docker Images:
  * Docker images are read-only templates from which containers are created. They are built using Dockerfiles, which are instructions for creating the image.
* Docker Hub:
  * Docker Hub is a public registry where users can share and discover container images.
* Benefits of using Docker:
  * Docker simplifies application development and deployment, improves consistency across environments, and facilitates collaboration among developers, according to Docker docs and Docker.

## Manual Installation

```bash
cd /tmp
curl -fsSL https://get.docker.com -o /get-docker.sh
sudo sh ./get-docker.sh --dry-run
sudo sh ./get-docker.sh
```

1. Once Docker has finished installing to your Raspberry Pi, there are a couple more things we need to do.

For another user to be able to interact with Docker, it needs to be added to the docker group.

So, our next step is to add our current user to the docker group by using the usermod command as shown below. By using "$USER" we are inserting the environment variable that stores the current users name.

2. Since we made some changes to our user, we will now need to log out and log back in for it to take effect.

You can log out by running the following command in the terminal.

```bash
sudo usermod -aG docker $USER # an logout
docker run hello-world
```

## Automated Installation

### Ansible roles

```bash
ansible-playbook docker.yml -K
```

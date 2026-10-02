    #!/bin/bash
    
    # update packages
    dnf update -y

    # install docker
    dnf install docker -y
    systemctl start docker
    systemctl enable docker

    # add ec2-user to docker group
    usermod -aG docker ec2-user

    # pull and run your app
    docker pull ${docker_username}/capstone-backend:latest
    docker run -d \
      -p 3000:3000 \
      --name capstone-backend \
      --restart unless-stopped \
      ${docker_username}/capstone-backend:latest
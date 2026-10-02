resource "aws_security_group" "capstone-sg" {
  description = "AWS capstone SG"
  name = "${var.env}-capstone-sg"
  vpc_id = aws_vpc.my-vpc.id

  ingress{
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH Port"
  }

  ingress{
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "APP Port"
  }

  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "All outbound allowed"
  }

  tags = {
    Name="${var.env}-capstone-sg"
  }
}

resource "aws_instance" "capstone-server" {
  key_name = var.ec2_key_pair
  ami = var.ec2_ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.public-1.id

  vpc_security_group_ids = [aws_security_group.capstone-sg.id]

user_data = templatefile("installDocker.sh", {
    docker_username = var.docker_username
  })

  tags = {
    Name= "${var.env}-capstone-server"
    enviroment= var.env
  }
  
}
provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "monitoring_sg" {
  name = "monitoring-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "monitoring_server" {
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t3.micro"

  security_groups = [aws_security_group.monitoring_sg.name]

  key_name = "key1"

  user_data = <<-EOF
              #!/bin/bash

              apt update -y
              apt install docker.io -y

              systemctl start docker
              systemctl enable docker

              docker run -d \
              --name=node-exporter \
              --net="host" \
              --pid="host" \
              -v "/:/host:ro,rslave" \
              prom/node-exporter \
              --path.rootfs=/host

              PRIVATE_IP=$(hostname -I | awk '{print $1}')

              cat <<EOT > /home/ubuntu/prometheus.yml
              global:
                scrape_interval: 15s

              scrape_configs:
                - job_name: "node"

                  static_configs:
                    - targets: ["$PRIVATE_IP:9100"]
              EOT

              docker run -d \
              --name prometheus \
              -p 9090:9090 \
              -v /home/ubuntu/prometheus.yml:/etc/prometheus/prometheus.yml \
              prom/prometheus

              docker run -d \
              --name=grafana \
              -p 3000:3000 \
              grafana/grafana
              EOF

  tags = {
    Name = "MonitoringServer"
  }
}

output "public_ip" {
  value = aws_instance.monitoring_server.public_ip
}
resource "aws_security_group" "this" {
  name        = format("%s-bastion-host-sg", var.namespaced_department_name)
  description = "Allows SSH connections from local machine"
  vpc_id      = local.vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = format("%s-bastion-host-sg", var.namespaced_department_name)
  }
}

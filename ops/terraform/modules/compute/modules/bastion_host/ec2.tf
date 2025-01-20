resource "aws_instance" "this" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = local.subnets.public.id[0]
  vpc_security_group_ids = [aws_security_group.this.id]

  tags = {
    Name = var.namespaced_department_name
  }
}

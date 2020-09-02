resource "aws_instance" "web_server" {
  ami                    = "ami-0a780d5bac870126a"
  vpc_security_group_ids = ["${aws_security_group.web_server.id}"]
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.mykeypair.key_name
  iam_instance_profile   = aws_iam_instance_profile.cloudwatch_logs-instanceprofile.name


  user_data = data.template_cloudinit_config.cloudinit-example.rendered
  tags = {
    Name = "${var.server_name}"
  }



}
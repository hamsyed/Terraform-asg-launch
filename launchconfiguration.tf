resource "aws_launch_configuration" "asg-launch-webserver" {
  image_id          = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "terraform"
  security_groups = ["${aws_security_group.webserver_sg.id}"]
  
  user_data = <<-EOF
              #!/bin/bash
              sudo yum install httpd -y
              sudo systemctl start httpd 
              sudo systemctl enable httpd 
              echo "Hello world " >/var/www/html/index.html
              instance_ip=`curl http://169.254.169.254/latest/meta-data/public-ipv4`
              echo $instance_ip >>/var/www/html/index.html
              EOF
  lifecycle {
    create_before_destroy = true
  }
  
  tags = {
    Name = "${terraform.workspace}"
}

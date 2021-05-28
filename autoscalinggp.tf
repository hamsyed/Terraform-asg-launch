resource "aws_autoscaling_group" "webserver" {
  name                      = "apache autoscaling gp"
  max_size                  = 3
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 2
  launch_configuration      = "${aws_launch_configuration.asg-launch-webserver.id}"
  availability_zones = "${var.azs}"

  tag {
		key = "Name"
		value = "terraform-asg"
		propagate_at_launch = true  
	}

}

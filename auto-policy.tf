resource "aws_autoscaling_policy" "web-policy" {
  name                   = "webpolicy"
  policy_type = "TargetTrackingScaling"
  autoscaling_group_name = "${aws_autoscaling_group.webserver.name}"

  target_tracking_configuration {
  predefined_metric_specification {
    predefined_metric_type = "ASGAverageCPUUtilization"
    }

      target_value = 40.0
  }

}

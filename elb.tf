# Create a new load balancer
resource "aws_elb" "prod-elb" {
  name               = "prod-elb"
  #availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

#  access_logs {
#    bucket        = "glauciushabucketnewhorizon2020"
#    bucket_prefix = "elb"
#    interval      = 60
#  }

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/check.html"
    interval            = 30
  }

  instances                   = [aws_instance.WEB01.id,aws_instance.WEB02.id,aws_instance.WEB03.id]
  subnets                     = [aws_subnet.prod-subnet-public-1.id,aws_subnet.prod-subnet-public-2.id,aws_subnet.prod-subnet-public-3.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "prod-elb"
  }
}
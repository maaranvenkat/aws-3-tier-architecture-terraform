# Application Load Balancer
resource "aws_lb" "my-alb" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg.id]
  subnets            = [aws_subnet.my-public-web-subnet-1.id, aws_subnet.my-public-web-subnet-2.id]

  tags = {
    Name = "${var.project_name}-alb"
  }
}
resource "aws_lb_target_group" "target-alb" {
  name     = "alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my-vpc.id
}
resource "aws_lb_target_group_attachment" "attachment1" {
  count            = length(aws_instance.my-app-server-1)
  target_group_arn = aws_lb_target_group.target-alb.arn
  target_id        = aws_instance.my-app-server-1[count.index].id
  port             = 80
depends_on = [
    aws_instance.my-app-server-1,
  ]
}
resource "aws_lb_target_group_attachment" "attachment2" {
  count            = length(aws_instance.my-app-server-2)
  target_group_arn = aws_lb_target_group.target-alb.arn
  target_id        = aws_instance.my-app-server-2[count.index].id
  port             = 80
depends_on = [
    aws_instance.my-app-server-2,
  ]
}
resource "aws_lb_listener" "my-alb-listener" {
  load_balancer_arn = aws_lb.my-alb.arn
  port              = "80"
  protocol          = "HTTP"
default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-alb.arn
  }
}
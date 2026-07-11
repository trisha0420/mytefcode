resource "aws_lb" "this" {
    name = "${var.name}-alb"

    load_balancer_type = "application"
    subnets = var.subnets
}

resource "alb_lb_target_group" "blue" {
    name = "${var.name}-blue"
    port = 80
    protocol = "HTTP"
    target_type = "ip"
    vpc_id = var.vpc_id

    health_check {
        path = "/"
    }  
}

# Green target group
resource "aws_lb_target_group" "green" {
    name = "${var.name}-green"
    part = 80
    protocol = "HTTP"
    target_type = "ip"
    vpc_id = var.vpc_id

    health_check {
      path = "/"
    }
  
}

resource "alb_lb_listener" "prod" {
    load_balancer_arn = aws_lb.this.arn
    port = 80

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.blud.id
    }
}
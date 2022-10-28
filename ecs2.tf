/*resource "aws_ecs_task_definition" "aws-ecs-task2" {
  family = "${var.app_name2}-task"

  
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "${var.app_name2}-${var.app_environment}-container",
      "image"     : "hello-world:latest",
      "cpu"       : 256,
      "memory"    : 512,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 80,
          "hostPort"      : 80
        }
      ]
    }
  ]
  DEFINITION

  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  memory                   = "512"
  cpu                      = "256"
  execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn
  task_role_arn            = aws_iam_role.ecsTaskExecutionRole.arn

  tags = {
    Name        = "${var.app_name2}-ecs-td"
    Environment = var.app_environment
  }
}

data "aws_ecs_task_definition" "main2" {
  task_definition = aws_ecs_task_definition.aws-ecs-task2.family
}

resource "aws_ecs_service" "aws-ecs-service2" {
  name                 = "${var.app_name2}-${var.app_environment}-ecs-service"
  cluster              = aws_ecs_cluster.cluster.id
  task_definition      = "${aws_ecs_task_definition.aws-ecs-task2.family}:${max(aws_ecs_task_definition.aws-ecs-task2.revision, data.aws_ecs_task_definition.main2.revision)}"
  launch_type          = "FARGATE"
  scheduling_strategy  = "REPLICA"
  desired_count        = 1
  force_new_deployment = true

  network_configuration {
    subnets          = aws_subnet.private.*.id
    assign_public_ip = true
    security_groups = [
      aws_security_group.sg.id,
      
    ]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.hello_world.id
    container_name   = "${var.app_name2}-${var.app_environment}-container"
    container_port   = 80
  }

  depends_on = [aws_lb_listener.hello_world]
}*/
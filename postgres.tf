module "rds_cluster_aurora_postgres" {
  source = "cloudposse/rds-cluster/aws"
  # Cloud Posse recommends pinning every module to a specific version
  # version     = "x.x.x"

  name            = "postgres"
  engine          = "aurora-postgresql"
  cluster_family  = "aurora-postgresql13"
  # 1 writer, 1 reader
  cluster_size    = 1
  # 1 writer, 3 reader
  # cluster_size    = 4
  # 1 writer, 5 reader
  # cluster_size    = 6
  namespace       = "eg"
  stage           = "dev"
  admin_user      = "postgres"
  admin_password  = "Test123456789"
  db_name         = "postgres"
  db_port         = 5432
  instance_type   = "db.t3.medium"
  vpc_id          = aws_vpc.main.id
  security_groups = [aws_security_group.sg.id]
  subnets         = aws_subnet.public.*.id
  /*zone_id         = "Zxxxxxxxx"*/
}
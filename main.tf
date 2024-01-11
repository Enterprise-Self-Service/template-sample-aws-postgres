resource "aws_db_instance" "rds-postgres" {
  identifier             = var.identifier
  storage_type           = var.storagetype
  allocated_storage      = var.storagesize
  max_allocated_storage  = var.max_allocated_storage
  iops                   = var.iops
  storage_encrypted      = var.storage_encrypted
  engine                 = "postgres"
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  port                   = 5432
  db_subnet_group_name   = aws_db_subnet_group.subnet-group.name
  vpc_security_group_ids = local.subnet_ids
  db_name                = var.db_name
  username               = var.administrator_username
  # password               = var.password
  manage_master_user_password = true
  multi_az                    = true
  publicly_accessible         = false
  deletion_protection         = false
  skip_final_snapshot         = true
  # create_db_parameter_group = false
  parameter_group_name    = aws_db_parameter_group.postgres.id
  backup_retention_period = var.backup_retention_period
  monitoring_interval     = var.monitoring_interval
  # monitoring_role_arn     = aws_iam_role.rds_monitoring.arn
  tags = {
    "Name" : var.identifier
  }
  # option_group_name         = aws_db_option_group.dboptions.id
  maintenance_window                  = "Sun:00:00-Sun:03:00"
  backup_window                       = "03:00-06:00"
  apply_immediately                   = true
  ca_cert_identifier                  = "rds-ca-rsa2048-g1"
  iam_database_authentication_enabled = true
  enabled_cloudwatch_logs_exports = [
    "postgresql"
  ]
}

resource "aws_db_subnet_group" "subnet-group" {
  name        = "subnet-group-${var.identifier}"
  description = "DB Postgres subnet group"
  subnet_ids  = data.aws_subnets.all.ids
  tags = {
    Name = "subnet-group-postgres-${var.identifier}"
  }
}

resource "aws_db_parameter_group" "postgres" {
  name   = "postgres-${var.identifier}-parameter-group"
  family = var.db_parameter_group
}

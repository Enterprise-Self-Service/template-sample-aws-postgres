data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_vpcs" "selected" {
  filter {
    name   = "state"
    values = ["available"]
  }
}

data "aws_subnets" "all" {
  filter {
    name   = "vpc-id"
    values = ["*"]
  }
}

data "aws_security_groups" "all" {
  filter {
    name   = "vpc-id"
    values = [local.vpc_id]
  }
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["monitoring.rds.amazonaws.com"]
    }
  }
}

data "aws_iam_policy" "rds_monitoring" {
  name = "AmazonRDSEnhancedMonitoringRole"
}
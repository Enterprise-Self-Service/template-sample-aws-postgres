locals {
  vpc_id     = sort(data.aws_vpcs.selected.ids)[0]
  region     = data.aws_region.current.name
  subnet_ids = data.aws_security_groups.all.ids
  account_id = data.aws_caller_identity.current.id
}
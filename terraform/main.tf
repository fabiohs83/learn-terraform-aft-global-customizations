# resource "aws_s3_account_public_access_block" "block_all_public" {
#   block_public_acls   = true
#   block_public_policy = true
#   ignore_public_acls  = true
#   restrict_public_buckets  = true
# }

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "sandbox_bucket" {
  bucket = "aft-sandbox-global${data.aws_caller_identity.current.account_id}"
  acl    = "private"
  tags = {
    Name        = "My AFT bucket-${data.aws_caller_identity.current.account_id}"
    Pipeline    = "aft-global-customizations"
  }
}
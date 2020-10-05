provider "aws" {
  region = "eu-west-1"
}

module "my_policy" {
  source = "git@github.com:paloth/terraform-aws-policy.git"

  policy_name        = "my_policy"
  policy_description = "my policy does something"
  policy_document_id = "AllowSomething"

  policy_body = {
    statement1 = {
      sid        = "statement1",
      effect     = "Allow",
      actions    = ["s3:*"],
      resources  = ["*"],
      conditions = [
        {
          test     = "StringLike",
          variable = "s3:prefix",
          values   = ["", "home/", "home/&{aws:username}/"]
        }
      ] # One condition for this statement. More statement can be added in the list
    },
    statement2 = {
      sid        = "statement2",
      effect     = "Allow",
      actions    = ["ec2:*"],
      resources  = ["*"],
      principals = [], # No principals for this statement
      conditions = []  # No condition for this statement
    },
  }
}

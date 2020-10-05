module "my_policy" {
    source = "terraform-aws-policy"

    policy_name = "my_policy"
    policy_description = "my policy does something"
    policy_document_id = "AllowSomething"

    policy_body = {
        statement1 = {
          sid        = "statement1",
          effect     = "Allow",
          actions    = ["s3:*"],
          resources  = ["*"],
          principals = [
            { type = "Service", identifiers = ["ec2.amazonaws.com"] },
            { type = "Service", identifiers = ["lambda.amazonaws.com"]}
          ], # Two principals for this statement. More can be added
          conditions = [
            {
              test = "StringLike",
              variable = "s3:prefix",
              values = ["", "home/", "home/&{aws:username}/"]
            }
          ] # One condition for this statement. More statement can be added in the list
        },
        statement2 = {
          sid        = "statement2",
          effect     = "Allow",
          actions    = ["ec2:*"],
          resources  = ["*"],
          principals = [],# No principals for this statement
          conditions = [] # No condition for this statement
        },
    }
}
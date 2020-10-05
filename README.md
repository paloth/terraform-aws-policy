# Terraform AWS Policy 

This module create a policy with dynamic statements

## Example

```hcl
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
          conditions = [] # No condition for this statement
        },
    }
}
```

## Requirements

| Name      | Version |
| --------- | ------- |
| terraform | ~> 0.13 |
| aws       | ~> 3    |

## Inputs

| Name                 | Description                         | Type                                                                                                                                                                                                                                                                                     | Default | Required |
| -------------------- | ----------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | :------: |
| policy\_body         | The body parameters of the policy.  | <pre>map(object(<br>    {<br>      sid        = string<br>      effect     = string<br>      actions    = list(string)<br>      resources  = list(string)<br>      conditions = list(object({ test = string, variable = string, values = list(string) }))<br>    }<br>    )<br>  )</pre> | n/a     |   yes    |
| policy\_name         | The name of the policy.             | `string`                                                                                                                                                                                                                                                                                 | n/a     |   yes    |
| policy\_description  | Description of the IAM policy.      | `string`                                                                                                                                                                                                                                                                                 | `null`  |    no    |
| policy\_document\_id | The id of the policy document.      | `string`                                                                                                                                                                                                                                                                                 | `null`  |    no    |
| policy\_path         | Path in which to create the policy. | `string`                                                                                                                                                                                                                                                                                 | `"/"`   |    no    |

## Outputs

| Name         | Description |
| ------------ | ----------- |
| policy\_arn  | Policy arn  |
| policy\_id   | Policy id   |
| policy\_name | Policy name |

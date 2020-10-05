data "aws_iam_policy_document" "this" {
  policy_id = var.policy_document_id

  dynamic "statement" {
    for_each = var.policy_body

    content {
      sid       = title(statement.value.sid)
      effect    = title(statement.value.effect)
      actions   = statement.value.actions
      resources = statement.value.resources

      dynamic "condition" {
        for_each = statement.value.conditions

        content {
          test     = condition.value.test
          variable = condition.value.variable
          values   = condition.value.values
        }
      }
    }
  }
}

resource "aws_iam_policy" "this" {
  name        = var.policy_name
  path        = var.policy_path
  description = var.policy_description

  policy = data.aws_iam_policy_document.this.json
}

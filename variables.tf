variable "policy_body" {
  type = map(object(
    {
      sid        = string
      effect     = string
      actions    = list(string)
      resources  = list(string)
      principals = list(object({ type = string, identifiers = list(string) }))
      conditions = list(object({ test = string, variable = string, values = list(string) }))
    }
    )
  )
  description = "The body parameters of the policy."
}

variable "policy_name" {
  type        = string
  description = "The name of the policy."
}

variable "policy_document_id" {
  type        = string
  description = "The id of the policy document."
  default     = null
}

variable "policy_path" {
  type        = string
  description = "Path in which to create the policy."
  default     = "/"
}

variable "policy_description" {
  type        = string
  description = "Description of the IAM policy."
  default     = null
}

output "password_policy" {
  description = "Account-level IAM password policy baseline."
  value = {
    min_length       = aws_iam_account_password_policy.strict.minimum_password_length
    max_age_days     = aws_iam_account_password_policy.strict.max_password_age
    reuse_prevention = aws_iam_account_password_policy.strict.password_reuse_prevention
    requires_upper   = aws_iam_account_password_policy.strict.require_uppercase_characters
    requires_lower   = aws_iam_account_password_policy.strict.require_lowercase_characters
    requires_number  = aws_iam_account_password_policy.strict.require_numbers
    requires_symbol  = aws_iam_account_password_policy.strict.require_symbols
  }
}

# Create IAM Role for EC2
resource "aws_iam_role" "Hello_world_iam" {
    name = "Hello_world_iam"  

# Terraform's "jsonencode" function converts a
# Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })


 inline_policy {
    name   = "policy-8675309"
    policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = [
            "logs:CreateLogStream",
            "Logs:DescrisbeLogsStreams",
            "logs:CreateLogGroup",
            "logs:PutLogsEvents"
            ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
 }

   tags = {
    tag-key = "tag-value"
  }

}


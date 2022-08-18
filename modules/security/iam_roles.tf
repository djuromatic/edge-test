resource "aws_iam_role_policy" "ec2_to_assm" {
  name = "ec2_to_assm_testnet"
  role = aws_iam_role.ec2_to_assm.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ssm:PutParameter",
          "ssm:DeleteParameter",
          "ssm:GetParameter"
        ]
        Effect   = "Allow"
        Resource = format("arn:aws:ssm:%s:%s:parameter/%s/*", var.region, var.account_id, var.ssm_id)
      },
      {
        Action =  [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject"
        ]
        Effect = "Allow",
        Resource = [format("arn:aws:s3:::%s/*", var.s3_bucket_name)]
      },
      {
        Action =  ["s3:ListBucket"]
        Effect = "Allow",
        Resource = [format("arn:aws:s3:::%s", var.s3_bucket_name)]
      }
    ]
  })

}

resource "aws_iam_role" "ec2_to_assm" {
  name = "ec2_to_assm_testnet"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_to_assm" {
    name = "allow_ec2_to_assm_testnet"
    role = "ec2_to_assm_testnet"
}
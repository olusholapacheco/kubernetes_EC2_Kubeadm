resource "aws_iam_instance_profile" "s3_profile" {
  name = "s3_profile"
  role = aws_iam_role.role.name
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "role" {
  name               = "S3_role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_policy" "policy" {
  name        = "s3AccessPolicy"
  path        = "/"
  description = "Policy to access s3 bucket"
  policy = <<POLICY

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject"
            ],
            "Resource": "arn:aws:s3:::${var.bucket_name}/*"
        }
    ]
}

POLICY
}

resource "aws_iam_policy_attachment" "s3attach" {
  name       = "s3BucketPolicyAttachment"
  roles      = [aws_iam_role.role.name]
  policy_arn = aws_iam_policy.policy.arn
}
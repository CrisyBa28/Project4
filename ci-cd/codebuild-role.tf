# This file defines the IAM role and policy for AWS CodeBuild to access
resource "aws_iam_role" "codebuild_service_role" {
  name = "CodeBuildServiceRole"
  assume_role_policy = data.aws_iam_policy_document.codebuild_assume_role_policy.json
}

data "aws_iam_policy_document" "codebuild_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
  }
}

# Attach a managed policy or inline policy that grants minimal permissions
resource "aws_iam_role_policy_attachment" "codebuild_service_role_attach" {
  role       = aws_iam_role.codebuild_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeBuildDeveloperAccess"
}

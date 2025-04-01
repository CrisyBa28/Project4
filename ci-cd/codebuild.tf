# This file contains the code to create a CodeBuild project for the CI/CD pipeline.
resource "aws_codebuild_project" "terraform_build" {
  name         = "terraform_build"
  service_role = aws_iam_role.codebuild_service_role.arn

  # Artifacts section indicates that outputs will be provided back to CodePipeline
  artifacts {
    type = "CODEPIPELINE"
  }

  # Use the pipeline as the source
  source {
    type            = "CODEPIPELINE"
    buildspec       = "buildspec.yml"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    type                        = "LINUX_CONTAINER"
    privileged_mode             = false
  }
}

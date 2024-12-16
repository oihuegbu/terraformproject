resource "aws_codebuild_project" "uchicago_build" {
    name = "uni-chicago"
    service_role = aws_iam_role.iam_for_ucodebuild.arn

    source {
      type = "CODEPIPELINE"
      location = "https://github.com/oihuegbu/terraformproject.git"
      buildspec = "buildspec.yml"
    }

    environment {
        compute_type = "BUILD_GENERAL1_SMALL"
        image = "aws/codebuild/standard:7.0"
        type = "LINUX_CONTAINER"

        environment_variable {
          name = "deploy"
          value = "0"
        }
    }

    artifacts {
      type = "CODEPIPELINE"
    }

    # lifecycle {
    #   prevent_destroy = true
    #   ignore_changes = all
    # }

}
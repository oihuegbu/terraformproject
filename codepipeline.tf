resource "aws_codepipeline" "codepipeline" {
    name     = "uni-chicago-pipeline"
    role_arn = aws_iam_role.iam_for_codepipeline.arn

    artifact_store {
        location = aws_s3_bucket.codepipeline_bucket.bucket
        type = "S3"
    }

    stage {
      name = "Source"
      action {
        name = "Source"
        category = "Source"
        owner = "ThirdParty"
        provider = "GitHub"
        output_artifacts = ["SourceArtifact"]
        namespace = "SourceVariables"
        version = "1"

        configuration = {
            Owner = "oihuegbu"
            Repo = "terraformproject"
            Branch = "main"
            OAuthToken = local.githubToken.github-token
        }
      }
    }

    stage {
      name = "Build"
      action {
        name = "Build"
        category = "Build"
        owner = "AWS"
        provider = "CodeBuild"
        input_artifacts = ["SourceArtifact"]
        output_artifacts = ["buildArtifacts"]
        version = "1"

        configuration = {
            ProjectName = "uni-chicago"
        }
      }      
    }
}

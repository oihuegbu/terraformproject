data "aws_ssm_parameter" "github_token" {
    name = "githubtoken"
}

resource "aws_codepipeline" "ucodepipeline" {
    name     = "uni-chicago-pipeline"
    role_arn = aws_iam_role.iam_for_ucodepipeline.arn

    artifact_store {
        location = aws_s3_bucket.codepipeline_bucket.bucket                                     //data.aws_s3_bucket.ucodepipeline_bucket.value                                 //aws_s3_bucket.codepipeline_bucket.bucket                          
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
            OAuthToken = data.aws_ssm_parameter.github_token.value
        }
      }
    }

    stage {
      name = "PreBuild"
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
            # environment_variable = [
            #     {
            #         name = "deploy"
            #         value = "0"
            #         type = "PLAINTEXT"
            #     },
            # ]
        }
      }      
    }

    stage {
      name = "ManualApproval"
      action {
        name = "Approval"
        category = "Approval"
        owner    = "AWS"
        provider = "Manual"
        version  = "1"
      }
    }

    stage {
      name = "Deploy"
      action {
        name = "Build"
        category = "Build"
        owner = "AWS"
        provider = "CodeBuild"
        input_artifacts = ["SourceArtifact"]
        output_artifacts = ["deployArtifacts"]
        version = "1"

        configuration = {
            ProjectName = "uni-chicago"
            # environment_variable = [
            #     {
            #         name = "deploy"
            #         value = "1"
            #         type = "PLAINTEXT"
            #     },
            # ]
        }
      }      
    }

    lifecycle {
      prevent_destroy = true
      ignore_changes = all
    }
}
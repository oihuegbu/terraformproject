import {
    to = aws_iam_role.iam_for_codebuild
    id = "iam_for_codebuild"
}

import {
    to = aws_iam_role_policy.codebuild_policy
    id = "uchicago_codebuild_policy"
}

import {
    to = aws_iam_role.iam_for_codepipeline
    id = "iam_for_codepipeline"
}

import {
    to = aws_iam_role_policy.codepipeline_policy
    id = "iam_for_codepipeline"
}

import {
    to = aws_codepipeline.codepipeline
    id = "uni-chicago-pipeline"
}

import {
    to = aws_codebuild_project.chicago_build
    id = "uni-chicago"
}

import {
    to = aws_s3_bucket.codepipeline_bucket
    id = "unichicago-codepipeline-bucket"
}


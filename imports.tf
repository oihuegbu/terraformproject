import {
    to = aws_iam_role.iam_for_ucodebuild
    id = "iam_for_codebuild"
}

import {
    to = aws_iam_role_policy.ucodebuild_policy
    id = "uchicago_codebuild_policy"
}

import {
    to = aws_iam_role.iam_for_ucodepipeline
    id = "iam_for_codepipeline"
}

import {
    to = aws_iam_role_policy.ucodepipeline_policy
    id = "iam_for_codepipeline"
}

import {
    to = aws_codepipeline.unicodepipeline
    id = "uni-chicago-pipeline"
}

import {
    to = aws_codebuild_project.unichicago_build
    id = "uni-chicago"
}
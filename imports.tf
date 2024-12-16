import {
    to = aws_iam_role.iam_for_ucodebuild
    id = "iam_for_codebuild"
}

import {
    to = aws_iam_policy.ucodebuild_policy
    id = "uchicago_codebuild_policy"
}

# import {
#     to = aws_iam_role.codepipeline
#     id = "iam_for_codepipeline"
# }

# import {
#     to = aws_codepipeline.codepipeline
#     id = "uni-chicago-pipeline"
# }

import {
    to = aws_codebuild_project.uchicago_build
    id = "uni-chicago"
}